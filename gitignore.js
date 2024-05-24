const fs = require('fs')

fetch('https://api.github.com/gitignore/templates/Kotlin')
    .then((data) => data.json())
    .then((data) => data.source)
    .then((data) => fs.writeFileSync('./kotlin/.gitignore', data))