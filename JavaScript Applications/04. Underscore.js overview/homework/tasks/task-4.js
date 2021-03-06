/* 
Create a function that:
*   **Takes** an array of animals
    *   Each animal has propeties `name`, `species` and `legsCount`
*   **groups** the animals by `species`
    *   the groups are sorted by `species` descending
*   **sorts** them ascending by `legsCount`
    *   if two animals have the same number of legs sort them by name
*   **prints** them to the console in the format:

```
    ----------- (number of dashes is equal to the length of the GROUP_1_NAME + 1)
    GROUP_1_NAME:
    ----------- (number of dashes is equal to the length of the GROUP_1_NAME + 1)
    NAME has LEGS_COUNT legs //for the first animal in group 1
    NAME has LEGS_COUNT legs //for the second animal in group 1
    ----------- (number of dashes is equal to the length of the GROUP_2_NAME + 1)
    GROUP_2_NAME:
    ----------- (number of dashes is equal to the length of the GROUP_2_NAME + 1)
    NAME has LEGS_COUNT legs //for the first animal in the group 2
    NAME has LEGS_COUNT legs //for the second animal in the group 2
    NAME has LEGS_COUNT legs //for the third animal in the group 2
    NAME has LEGS_COUNT legs //for the fourth animal in the group 2
```
*   **Use underscore.js for all operations**
*/

function solve() {
    return function(animals) {
        var animals = animals;

        var sorted = _.sortBy(animals, 'species').reverse();
        var grouped = _.groupBy(sorted, 'species');
        //console.log(sorted)
        //console.log(grouped);

        _.forEach(grouped, function(value, key) {
            var divider = Array(key.length + 2).join('-');

            console.log(divider);
            console.log(key + ':');
            console.log(divider);

            var sortedByLegs = _.sortBy(value, 'legsCount');

            //console.log(sortedByLegs);
            _.forEach(sortedByLegs, function(animal) {
                console.log(animal.name + ' has ' + animal.legsCount + ' legs')
            })

        });
    };
}

module.exports = solve;

// var _ = require('underscore');

// var animals = [{
//     name: 'Minkov',
//     species: 'Bogomolka',
//     legsCount: 4
// }, {
//     name: 'Minkov',
//     species: 'Bogomolka',
//     legsCount: 5
// }, {
//     name: 'Doncho',
//     species: 'Centipede',
//     legsCount: 201
// }, {
//     name: 'Komara',
//     species: 'Mosquito',
//     legsCount: 8
// }];

// var testFunc = solve();
// testFunc(animals);
