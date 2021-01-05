module CoursesHelper
    def  rarray_to_js(arr)
        if arr.first.is_a? Integer
          escape_javascript("["+arr.join(",")+"]")
        else
          "['#{arr.join('\',\'')}']"
        end
    end
end
