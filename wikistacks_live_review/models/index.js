//
const Sequelize = require('sequelize');
const db = new Sequelize('postgres://localhost:5432/wikistack');

// pass in
const Page = require('./page');
module.exports = db;
