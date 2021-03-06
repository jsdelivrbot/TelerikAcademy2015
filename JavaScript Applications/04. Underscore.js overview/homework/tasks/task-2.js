/*
Create a function that:
*   Takes an array of students
    *   Each student has a `firstName`, `lastName` and `age` properties
*   **finds** the students whose age is between 18 and 24
*   **prints**  the fullname of found students, sorted lexicographically ascending
    *   fullname is the concatenation of `firstName`, ' ' (empty space) and `lastName`
*   **Use underscore.js for all operations**
*/

function solve() {
    return function(students) {
        var students = students;
        var filtered = _.filter(students, function(student) {
            return (18 <= student.age && student.age <= 24);
        });

        var mapped = _.map(filtered, function(student) {
            return student.firstName + ' ' + student.lastName;
        });

        var ordered = _.sortBy(mapped, function(fullname) {
            return fullname;
        });

        _.forEach(ordered, function(fullname) {
            console.log(fullname);
        });

    };
}

module.exports = solve;
