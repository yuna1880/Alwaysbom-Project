<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

/**
* Animate scrolling to a target position
* @param {string} _selector Target selector
* @param {number} _duration (Option) Duration time(ms) (Default. 800ms)
* @param {number} _adjust (Option) Adjustment value of position
*/
<script>
    let headerMenuHeight = document.querySelector(".h-menu-bar").offsetHeight;

    let reviewScrollVal = document.querySelector("#review-area").offsetTop;

    window.scrollTo({top:reviewScrollVal - headerMenuHeight, behavior:'smooth'});
</script>




</body>
</html>


