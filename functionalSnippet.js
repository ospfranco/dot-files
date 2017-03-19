// Pure imperative approach
updateConstraints = trips => {
  if (!trips.length) {
    this.min = 0;
    this.max = 0;
    this.currentMin = 0;
    this.currentMax = 0;
    return;
  }
  
  let min = trips[0].price;
  let max = trips[0].price;
  
  trips.forEach(trip => {
    if (trip.price < min) {
      min = trip.price;
    }
    
    if (trip.price > max) {
      max = trip.price;
    }
  })
  
  this.min = min;
  this.max = max;
  this.currentMin = min;
  this.currentMax = max;
}

// Functional approach with some es6 features
updateConstraints = (trips = []) => {
  trips = trips.length > 0 ? trips : [{price:0}];
  this.currentMin = this.min =
  trips.reduce((acc,cur) => Math.min(acc, cur.price), Number.MAX_SAFE_INTEGER);
  this.currentMax = this.max =
  trips.reduce((acc, cur) => Math.max(acc, cur.price), Number.MIN_SAFE_INTEGER);
}

// λ
updateConstraints = (trips = []) => {
  trips = trips.length > 0 ? trips.map(t => t.duration) : [0];
  this.currentMin = this.min = Math.min(...trips);
  this.currentMax = this.max = Math.max(...trips);
}