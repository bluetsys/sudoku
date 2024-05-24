const fs = require('fs')

fetch('https://api.github.com/gitignore/templates/Go')
    .then((data) => data.json())
    .then((data) => data.source)
    .then((data) => fs.writeFileSync('./golang/.gitignore', data))