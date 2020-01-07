function todayis() {
    var day = new Date(); // Create a date object to operate on
    var today = day.getDay(); // Obtain today's date
    
    var weekday = new Array(3);
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday.push("Wednesday");
    weekday.push("Thursday");
    
    var woops = ["Friday", "Saturday"];
    
    weekday = weekday.concat(woops);
    
    return "Today is " + weekday[today] + ".";
}
