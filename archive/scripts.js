document.addEventListener('DOMContentLoaded', filterCourses);


function filterCourses() {
    input = document.getElementById('searchBar'); //start by identifying the search bar as the input
    filter = input.value.toLowerCase(); //change what's in the search bar to lowercase. This will fix case sensitivity later on.
    div = document.getElementById('courseList'); //Identify the start of the courses
    elements = div.getElementsByTagName('h1' && 'p'); //Get the h1 and p elements in an array.
  
    for (i = 0; i < elements.length; i++) {
      element = elements[i];
      if (element.textContent.toLowerCase().indexOf(filter) > -1) { //switch the text to lowercase and then search through the text for the filter variable
        element.closest('.course').style.display = ''; //closest grabs the closest parent of the element.
      } else {
        element.closest('.course').style.display = 'none';
      }
    }
  }


function filterLevels() {
    var input = document.getElementById('level-filter'); //Identify the filter bar as the input
    var courses = document.querySelectorAll('.course'); //Identify all the courses. This is an array of all the courses.
  
    for (var i = 0; i < courses.length; i++) { //loop through all the courses
      var level = courses[i].querySelector('h3').textContent; //the variable level is what is written in h3 for that course.
  
      if (input.value === '' || input.value === level) {//input.value is '' if "all levels" is selected. Otherwise it matches the level from the course.
        courses[i].style.display = 'block'; //if there is either 'all levels' or the level from the course, display the course.
      } else {
        courses[i].style.display = 'none'; //otherwise, hide the course.
      }
    }
  }


//This function is dumb. All it does is switch the flexbox direction, as I'm already ordering the courses by level.
  function reverseFlexbox() {
    var courseList = document.getElementById("courseList"); //Identify the course list container.
    
    //this if statement just toggles the class. Then the css code takes over and changes the direction.
    if (courseList.classList.contains("flexbox")) { 
      courseList.classList.remove("flexbox");
      courseList.classList.add("reverse-flexbox");
    } else {
      courseList.classList.remove("reverse-flexbox");
      courseList.classList.add("flexbox");
    }
  //BUT WAIT! It gets more hacky. The option values are flipped in the html code. Because it didn't work otherwise.
  }

