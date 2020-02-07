const db = require("../data/db-config.js");


function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes").where({ id });
}

function findSteps(id) {
    return db("schemes as s").join("steps as st", "s.id", "st.scheme_id")
    .where( "s.id", id )
    .select("st.scheme_id", "st.step_number", "st.instructions")
}

function add(schemeData) {
    return db("schemes").insert(schemeData);
}

function update(changes, id) {
    return db("schemes").where({ id }).update(changes);
}

function remove(id) {
    return db("schemes").where({ id }).del();
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};
