const fs = require('fs')

fetch('https://api.github.com/gitignore/templates/Scala')
    .then((data) => data.json())
    .then((data) => data.source)
    .then((data) => fs.writeFileSync('./scala/.gitignore', data))