$(document).ready(function() {
    var colorClasses = ["is-info", "is-success", "is-warning", "is-primary"];
    var storyId = $("#story_id").val();

    initialize();

    function initialize() {
        $(".tag").each(function(_, elt) {
            var $elt = $(elt);
            var tagId = $elt.data("tag-id");
            var showing = $elt.data("showing");

            // Install click handler
            $elt.click(function() {
                selectTag(tagId, elt);
            });

            // Set initial active state
            if (showing) {
                colorTag($elt);
            }
        });
    }

    function selectTag(id, elt) {
        var $elt = $(elt);
        var shouldShow = !$elt.data("showing");
        var addOrRemove = shouldShow ? "add_tag" : "remove_tag";

        // UI
        if (shouldShow) {
            colorTag($elt);
        } else {
            colorClasses.forEach(function(c) {
                $elt.removeClass(c);
            });
        }

        $elt.data("showing", shouldShow);

        // Server
        $.post("/api/v1/stories/" + storyId + "/" + addOrRemove, {tag_id: id})
            .done(function(result, status) {
                console.log("Saved tag successfully!", result);
            })
            .fail(function(error) {
                console.log("Failed to save tag!", error);
            });
    }

    function colorTag($elt) {
        $elt.addClass(randElt(colorClasses));
    }

    function randElt(array) {
        return array[Math.floor(Math.random() * array.length)];
    }
});
