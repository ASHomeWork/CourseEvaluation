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

$(document).on('turbolinks:load', function(){
    $("a[title='new2']").click(function(event){
        event.preventDefault();
        alert("请登陆后尝试！");
    });
});