// this expects rails.js as a dependency.  see README for details.

(function($) {
    $.expr[':'].feature = function(obj, index, meta, stack) {
        if (meta[3] != undefined) {
            return ($(obj).attr('data-feature') == meta[3]); //match exact
        } else {
            return ($(obj).attr('data-feature') != undefined); //allow any value
        }
    };
    $.expr[':'].action = function(obj, index, meta, stack) {
        if (meta[3] == undefined) {
            return ($(obj).attr('data-action') != undefined); //allow any value
        } else {
            return ($(obj).attr('data-action') == meta[3]); //match exact
        }
    };
    $.expr[':'].widget = function(obj, index, meta, stack) {
        if (meta[3] == undefined) { // allow any value
            return !(widgetData(obj) == false);
        } else { // particular value
            return ( $(obj).attr('data-' + meta[3]) != undefined );
        }
    };

    // returns false or the widget name and value
    // note: if an object is multiple widgets, only the first is observed
    function widgetData(element) {
        var reservedKeywords = ['feature', 'action', 'method', 'confirm', 'with', 'method', 'remote', 'type', 'disable-with', 'actuate'];
        var data_attr = new RegExp(/^data-(.*)/i);

        for (i = 0; i < element.attributes.length; i++) {
            var attribute = element.attributes[i];
            var widgetName = attribute.name.match(data_attr);
            if (widgetName != null && reservedKeywords.indexOf(widgetName[1]) == -1) {
                return {
                    name:widgetName[1],
                    value:attribute.value
                };
            }
        }
        return false;
    }


    $.fn.cycle = function(selected) {
        this.children().hide().filter(':action(' + selected + ')').show();
    };

// assigns functionality based on data- tag ability, now and for new elements
// todo: upgrade to use deferred objects? http://api.jquery.com/category/deferred-object/
// allows easy and automated ujs
// when you provide a callback function, several things will be made available, including this.$widget, and this.data
// note: could the e variable name cause ie trouble?
    $.fn.ujs = function(action, ajaxEvent, handlerOrWidgetArgs) {
        if (arguments.length < 3) { //maybe there's a better standard jq way of doing this
            handlerOrWidgetArgs = arguments[1];
            ajaxEvent = 'success';
        }

//        console.log(action, 'event created on:', this);
        $(this).delegate('[data-action="' + action + '"]', 'ajax:' + ajaxEvent, function(e, data, status, xhr) {
//            console.log('firing delegated callback for', action);
            this.$feature = $(this).closest(':feature');
            this.$widget = $(this).closest(':widget');
            this.e = e;
            this.data = data;
            this.status = status;
            this.xhr = xhr;
            if (handlerOrWidgetArgs.prototype != undefined) { //is function?
                handlerOrWidgetArgs.call(this);
            } else { //is argument to pass to widget
                this.$widget.actuate(handlerOrWidgetArgs);
            }
        });
        return this;
    };

    // removes current ujs behavior, including default values.
    // note: default behaviors cannot be made to be overridden or extendible easily, as
    //   there's no way of telling what's going to fire from a particular event
    // note: (assumed) cannot currently be used to remove a specific handler,
    // as anonymous handler function used in original delegation
    $.fn.unUjs = function(action, ajaxEvent) {
        if (!ajaxEvent) {
            ajaxEvent = 'success';
        }
        $(this).undelegate('[data-action="' + action + '"]', 'ajax:' + ajaxEvent)
    }


    $(document).ujs('delete', function() {
        console.log('removing widget');
        this.$feature.remove();
    });

    $(document).ujs('create',
            function() {
                //console.log('create event firing');
                this.$feature.find('textarea,input:text,input:file').val("");
                this.$feature.find('.errors').empty();

                $(this.xhr.responseText).insertBefore(this); //could also use insertAfter as a default.
                // Neither is clearly better.  It could be automatically decided based on the index of the form
                // among its siblings, except for that difficulty arises when there are no siblings

            }).ujs('create', 'error',
            function() {
                //todo: automatically detect datatype?
                // http://www.alfajango.com/blog/rails-3-remote-links-and-forms-data-type-with-jquery/
                this.$feature.find('.errors').html(this.xhr.responseText);
            });

    // doesn't take a selector as argument, takes arguments to immediately pass on to next $.fn as specified by data- attr
    $.fn.actuate = function() {
        // todo.... another day. use widgetData function here (dry)
        var data_attr = new RegExp(/^data-(.*)/i);
        var reservedKeywords = ['feature', 'action', 'method', 'confirm', 'with', 'method', 'remote', 'type', 'disable-with', 'actuate'];
        // arguments gets reset in context of block, so
        var widgetArgs = arguments;

        jQuery.each(this, function(index, htmlElement) {
            jQuery.each(htmlElement.attributes, function(index, attribute) {
                var widgetName = attribute.name.match(data_attr);

                if (widgetName != null && reservedKeywords.indexOf(widgetName[1]) == -1) {

                    widgetName = widgetName[1];

                    var args = (widgetArgs.length == 0) ? attribute.value : widgetArgs

                    try {
                        $(htmlElement)[ widgetName ](args);
                    } catch(e) {
                        if (e instanceof TypeError) {  //todo: check cross browser compatibilities
                            if (console && console.log)
                            // if you see this error, this script is looking for $.fn.actionName to execute with the context of the object.
                                console.log('rails-ujs error, unfound jquery extend method:"', widgetName, '" from ', htmlElement);
                        } else {
                            throw(e);
                        }
                    }

                }
            });

        });
        return this;
    };


    // handle widgets as they're added to the page:
    $(function() {
        // add handlers to DOM insertion methods: appendChild insertBefore
        // put these at DOM ready -- no need for them sooner
        // (, or could this bring to light an edge-case bug, if someone modifies the dom while loading?)
        var orig_insertBefore = Element.prototype.insertBefore;
        Element.prototype.insertBefore = function(new_node, existing_node) {
            var r = orig_insertBefore.call(this, new_node, existing_node); //run the old method
//            console.log(this, 'hijacked insert!', orig_insertBefore, new_node, existing_node);
            $(new_node).trigger('rails.dom_insert');
            return r;
        };
        var orig_appendChild = Element.prototype.appendChild;
        Element.prototype.appendChild = function(child) {
            var r = orig_appendChild.call(this, child);
//            console.log(this, 'hijacked append!', orig_appendChild, child);
            $(child).trigger('rails.dom_insert');
            return r;
        };

        // automatically reads data- tags and links them to jquery.fn extensions, once DOM is ready.
        $('*').actuate();
        $(document).delegate('*', 'rails.dom_insert', function() {  //todo: could possibly be made less smelly w/ delegate
            console.log('dom insert', this);
//            $(this).find().add(this).each(init_widget); // scan all added elements for live ones
            $(this).find('*').add(this).actuate(); // scan all added elements for live ones
            return false; // this stops the propagation of live event to ancestors that match '*', ie, all of them.
        });
    });


})(jQuery);