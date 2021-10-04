int numDogs = 1;
int numFoods = 1;

Dog[] dogs = new Dog[numDogs];
//Food[] foods = new Food[numFoods];

void setup() {
  size(800, 600, P2D);

  for (int i=0; i<dogs.length; i++) {
    dogs[i] = new Dog(random(width), random(height));
  }    
  /*for (int i=0; i<foods.length; i++) {
    foods[i] = new Food(random(width), random(height));

  
} */
}

void draw() {
 background(127);

  for (int i=0; i<dogs.length; i++) {
    dogs[i].run();
  }
/* for (int i=0; i<foods.length; i++) {
    foods[i].run();
    

 } */
}
