const fs = require('fs')

fetch('https://api.github.com/gitignore/templates/Ruby')
    .then((data) => data.json())
    .then((data) => data.source)
    .then((data) => fs.writeFileSync('./Ruby/.gitignore', data))