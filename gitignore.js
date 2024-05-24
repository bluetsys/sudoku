const fs = require('fs')

fetch('https://api.github.com/gitignore/templates/C++')
    .then((data) => data.json())
    .then((data) => data.source)
    .then((data) => fs.writeFileSync('.gitignore', data))