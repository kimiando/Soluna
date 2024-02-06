function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

var dropdownContainers = document.getElementsByClassName("dropdown-container");

for (var i = 0; i < dropdownContainers.length; i++) {
  dropdownContainers[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.querySelector('.dropdown-content');

    var displayStyle = window.getComputedStyle(dropdownContent).getPropertyValue('display');

    if (displayStyle === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
