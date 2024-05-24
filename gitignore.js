const fs = require('fs')

fetch('https://api.github.com/gitignore/templates/Java')
    .then((data) => data.json())
    .then((data) => data.source)
    .then((data) => fs.writeFileSync('./java/.gitignore', data))