PImage img;
Sound sound1;
Sound sound2;

int DOT_SIZE = 30;
float OCTAVE = pow(2, 1); // up=>oct-down
float FREQ_RATE = 1.0594631;
float FREQ_BASE = 523.25 / OCTAVE;

int KEYS = 24;
int NOTE_LENGTH = 64;
int MARGIN_TOP = 239;
int MARGIN_LEFT = 30;
//int MARGIN_BOTTOM = 50;

color SOUND_1_COLOR = color(0, 176, 80); //green
color SOUND_2_COLOR = color(0, 176, 240); //blue

int cnt = 0;

void settings() {
  img = loadImage("dot_image.png");
  size(img.width, img.height);
}

void setup() {
  frameRate(5);
  noStroke();
  sound1 = new Sound();
  sound2 = new Sound();
}

void draw() {
  background(20);

  image(img, 0, 0);

  int x = ((cnt % NOTE_LENGTH) * DOT_SIZE) + MARGIN_LEFT;
  int pitch1 = -10;
  int pitch2 = -10;
  for(int keyIter=0; keyIter<=KEYS; keyIter++) {
    int y = MARGIN_TOP + ((KEYS - keyIter) * DOT_SIZE);
    color c = get(x, y);
    if(c == SOUND_1_COLOR) pitch1 = keyIter;
    if(c == SOUND_2_COLOR) pitch2 = keyIter;
  }

  fill(100, 30);
  rect(x, MARGIN_TOP, DOT_SIZE, DOT_SIZE*KEYS);

  fill(251, 176, 59);
  rect(x-1, MARGIN_TOP + ((KEYS - pitch1) * DOT_SIZE) -1, DOT_SIZE+1, DOT_SIZE+1);
  rect(x-1, MARGIN_TOP + ((KEYS - pitch2) * DOT_SIZE) -1, DOT_SIZE+1, DOT_SIZE+1);

  sound1.play(pitch1);
  sound2.play(pitch2);

  cnt++;
}
