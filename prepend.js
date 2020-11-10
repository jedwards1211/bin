#!/usr/bin/env node

var fs = require('fs')

var text = process.argv[2]
var file = process.argv[3]

var content = fs.readFileSync(file, 'utf8')
fs.writeFileSync(file, text + content, 'utf8')

