// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap'
import jquery from 'jquery'

$(document).on('turbolinks:load', function(){
    $("#course_college_id").change(function(){
        //$("#major_majorID").html("<select name='major' id='major'></select>");
        $.post( 
            "select_with_ajax",
            {"selected1":$("#course_college_id").val()},
            function(data){
                $("#course_major_id").empty();
                var datas = eval(data);
                $.each(datas,function(i){
                    $("#course_major_id").append("<option value='"+datas[i].id+"'>"+datas[i].name+"</option>");
            });	    
        });
    });
});

$(document).on('turbolinks:load', function(){
    $("#course_college_id").change(function(){
        //$("#major_majorID").html("<select name='major' id='major'></select>");
        $.post( 
            "select_with_ajax1",
            {"selected2":$("#course_college_id").val()},
            function(data){
                $("#course_teacher_id").empty();
                var datas = eval(data);
                $.each(datas,function(i){
                    $("#course_teacher_id").append("<option value='"+datas[i].id+"'>"+datas[i].name+"</option>");
            });	    
        });
    });
});



var starClicked = false;

$(function() {

    $('.star').click(function() {

        $(this).children('.selected').addClass('is-animated');
        $(this).children('.selected').addClass('pulse');

        var target = this;

        setTimeout(function() {
            $(target).children('.selected').removeClass('is-animated');
            $(target).children('.selected').removeClass('pulse');
        }, 1000);

        starClicked = true;
    })

    $('.half').click(function() {
        if (starClicked == true) {
            setHalfStarState(this)
        }
        $(this).closest('.rating').find('.js-score').text($(this).data('value'));

        $(this).closest('.rating').data('vote', $(this).data('value'));
        calculateAverage()
        console.log(parseInt($(this).data('value')));

    })

    $('.full').click(function() {
        if (starClicked == true) {
            setFullStarState(this)
        }
        $(this).closest('.rating').find('.js-score').text($(this).data('value'));

        $(this).find('js-average').text(parseInt($(this).data('value')));

        $(this).closest('.rating').data('vote', $(this).data('value'));
        calculateAverage()

        console.log(parseInt($(this).data('value')));
    })

    $('.half').hover(function() {
        if (starClicked == false) {
            setHalfStarState(this)
        }

    })

    $('.full').hover(function() {
        if (starClicked == false) {
            setFullStarState(this)
        }
    })

})

function updateStarState(target) {
    $(target).parent().prevAll().addClass('animate');
    $(target).parent().prevAll().children().addClass('star-colour');

    $(target).parent().nextAll().removeClass('animate');
    $(target).parent().nextAll().children().removeClass('star-colour');
}

function setHalfStarState(target) {
    $(target).addClass('star-colour');
    $(target).siblings('.full').removeClass('star-colour');
    updateStarState(target)
}

function setFullStarState(target) {
    $(target).addClass('star-colour');
    $(target).parent().addClass('animate');
    $(target).siblings('.half').addClass('star-colour');

    updateStarState(target)
}

function calculateAverage() {
    var average = 0

    $('.rating').each(function() {
        average += $(this).data('vote')
    })

    $('.js-average').text((average / $('.rating').length).toFixed(1))
}
function callModal(){
    $('#myModal').modal(options)
}