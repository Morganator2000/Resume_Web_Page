const courses = [
  {"title":"Tech Math for Computer Science",
    "code":"MAT8001C",
    "level":1,
    "description":"A math course that specifically deals with math relevant for computer programmers. Included binary, octal, and hexidecimal conversions, Boolean algebra, and vectors.",
    "image":"images/math.jpeg",
    "alt":"A math textbook"
  },
  {"title":"Introduction to Databases",
  "code":"CST8215",
  "level":1,
  "description":"The intro to Structured Query Language (SQL) and databases. We used MySQL for this course and learned how to design a relational database, including normalization. ",
  "image":"images/database.jpeg",
  "alt":"A server room"
  },
  {"title":"Intro to Computer Programming",
  "code":"CST8116",
  "level":1,
  "description":"Intro to computer programming concepts using Java. Focused on the basic concepts that are important to all high-level programming languages.",
  "image":"images/programming.jpeg",
  "alt":"Glasses in the foreground with blurred java code in the background"
  },
  {"title":"Computer Essentials",
  "code":"CST8101",
  "level":1,
  "description":"A brief overview of how software interacts with hardware. This was a very broad course that covered topics like operating systems, binary conversions, virtualization, file management, and basic networking. ",
  "image":"images/essentials.jpeg",
  "alt":"The interior of a computer, specifically the ram sticks"
  },
  {"title":"Technical Communication for Engineering and Technology",
  "code":"ENL2019T",
  "level":2,
  "description":"An english class dedicated to showing students how to write technical reports and documents. It had a strong focus on working in groups and the different parts of design projects. ",
  "image":"images/communication.jpeg",
  "alt":"A group of people working hard on a project"
  },
  {"title":"Web Programming",
  "code":"CST8285",
  "level":2,
  "description":"This class covered all of the important parts of designing a website. It covered html, css, JavaScript, and php languages. ",
  "image":"images/web.jpeg",
  "alt":"A picture of html code"
  },
  {"title":"Object-Oriented Programming",
  "code":"CST8284",
  "level":2,
  "description":"With this class I learned how to do object oriented programming with Java. The concepts here are applicable to any object-oriented programming language. ",
  "image":"images/OOP.jpg",
  "alt":"A picture of JavaScript, which is not an object oriented programming language, but I couldn't find a better picture"
  },
  {"title":"Operating Systems Fundamentals (GNU/Linux)",
  "code":"CST8102",
  "level":2,
  "description":"Intro to operating systems and terminal commands. Specifically with linux. After taking this course I'm convinced that linux is the superior operating system. ",
  "image":"images/Linux2.jpeg",
  "alt":"Picture of a penguin, referencing Linux's Tux mascot"
  },
  {"title":"Database Systems",
  "code":"CST2355",
  "level":2,
  "description":"A course dedicated to several database systems including Access, Microsoft SQL Server Management, and PostgreSQL databases. ",
  "image":"images/Big data.jpg",
  "alt":"A big server room"
  },
];

const search = document.getElementById("searchBar"); //declare what the search bar is
const levelFilter = document.getElementById("level-filter"); //declare what the level filter is
const levelSort= document.getElementById("level-sort"); //declare what the level sort is

//This listener has to be declared differently than the others. I don't know why, but it wasn't working the other way.
document.addEventListener('DOMContentLoaded', function() {
  createCourses(courses);
});

search.addEventListener("keyup", filterCourses); //listen for when the user types in the search bar
levelFilter.addEventListener("change", filterLevels); //listen for when the level filter changes
levelSort.addEventListener("change", sortLevels);//listen for when the level sort changes

//This function populates the course list container.
function createCourses(courses) {
  const courseList = document.getElementById("courseList"); //get the course list container
  for (let i = 0; i < courses.length; i++) { //simple for loop, does this for each entry in the array above.
    const newCourse = document.createElement("div");//create a div, call it a class course.
    newCourse.className ='course';
    courseList.appendChild(newCourse);

    const newDiv = document.createElement("div"); //this div will hold the course info minus the image.
    newCourse.appendChild(newDiv);

    const title = document.createElement("h1");//add the title.
    newDiv.appendChild(title);
    title.innerText = courses[i].title;

    const code = document.createElement("h2");//add the course code.
    newDiv.appendChild(code);
    code.innerText = courses[i].code;

    const level = document.createElement("h3"); //add the course level, and give it a label.
    newDiv.appendChild(level);
    level.innerText = "Level " + courses[i].level;
    
    const description = document.createElement("p");//add the description.
    newDiv.appendChild(description);
    description.innerText = courses[i].description;

    const image = document.createElement("img");//add the image, along with it's alt text.
    newCourse.appendChild(image);
    image.src = courses[i].image;
    image.alt = courses[i].alt;
  }
}

function filterCourses() {
  let filter = search.value.toLowerCase(); //this is what the user typed in, turned to lower case to avoid being case sensitive.
  let courses = document.querySelectorAll('.course');//make an array of all the courses. It wasn't working when I used the old array.

  for (let i = 0; i < courses.length; i++) {
    let course = courses[i]; //refering to the specific instance of one course.
    let title = course.querySelector('h1').textContent.toLowerCase(); //get the title of that course.
    let content = course.querySelector('p').textContent.toLowerCase(); //get the description of that course.

    if (title.includes(filter) || content.includes(filter)) { //match if the title or description includes the search term.
      course.style.display = 'flex'; //if it does, display the content.
    } else {
      course.style.display = 'none'; //if it doesn't, hide the content.
    } //then the loop repeats to the next course in the array.
  }
}


function filterLevels() {
  const courseContainer = document.querySelectorAll('.course');//find the course container

  courseContainer.forEach(function(courseContainer) { //a different way of doing a for loop.
    const level = courseContainer.querySelector('h3').textContent; //h3 contains the level, so extract it here.
    const currentLevel = levelFilter.value; //get the value that the level filter is set to.

    if (currentLevel === '' || level === currentLevel) { //if the filter is either "all" or the current level...
      courseContainer.style.display = 'flex'; //display the content.
      } else {
        courseContainer.style.display = 'none'; //don't.
      } //loop to the next course in the array.
  });
}

// I really overthought this function. Somtimes the easiest is the best.
function sortLevels() {
  document.getElementById("courseList").innerHTML = ""; //start by wiping out all the courses. Yes really.
  if (levelSort.value === "asc") { //if the sort is ascending...
    courses.sort((a, b) => a.level - b.level) //then sort the OG array by ascending level. 
  } if (levelSort.value === "desc") {//if descending...
    courses.sort((a, b) => b.level - a.level) //sort the OG array by descending level.
  }
  createCourses(courses); //then rebuild the course list, with the new modified array.
  filterCourses();//run the text filter again, so you can get both going at once.
}
