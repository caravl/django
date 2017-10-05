const router = require("express").Router();
const Hotel = require("../models").Hotel;
const Restaurant = require("../models").Restaurant;
const Activity = require("../models").Activity;
const Itinerary = require("../models").Itinerary;

router.get("/", (req, res, next) => {
  Promise.all([
    Hotel.findAll({ include: [{ all: true }] }),
    Restaurant.findAll({ include: [{ all: true }] }),
    Activity.findAll({ include: [{ all: true }] })
  ])
    .then(([hotels, restaurants, activities]) => {
      res.json({
        hotels,
        restaurants,
        activities
      });
    })
    .catch(next);
});

router.get('/api/itineraries/:id', function(req, res, next) {
  // var itineraryId = req.params.itinerary_id;
  Itinerary.findById(req.params.id, {
    include: [{ all: true, nested: true}]
    // where: { id: itineraryId }
  })
  // .then( (itinerary) =>  {
  //   console.log('hello')
  //   res.json({
  //     hotels,
  //     restaurants,
  //     activities
  //   })
  // })
  // .catch(next);
})

module.exports = router;
