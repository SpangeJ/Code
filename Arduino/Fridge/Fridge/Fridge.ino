/*
   I have a gap. There is a gap between my fridge and my wall, currently I fill it with the storage of two drying racks.
   Let's utilize it better by building a Wine, vegetable, and cheese cabinet.
   The Cabinet is powered with a 30A 12DC power supply, which is connected to 5 relays and from there a Peltier element for each relay.
   Each Peltier element is in its isolated zone so that each chamber can (with limitations) have an independent temperature relative to its neighbors.
   When an element is on the chamber will cool down. There is no heating mechanism, chambes temperature rises to approach ambient temperature.
   Yes, I assume the ambient temperature is higher than the set temperature of my fridge, dough!


   Joachim Spange KodeWorks, house day 7th July 2023
*/

const int ZONES = 5;
const int HYSTERESIS = 1;  // +/- Lag relative to set point before a change is made.
// Temperature span for each zone in Celcius
const float MIN[] = {5, 6, 8, 10, 12};
const float MAX[] = {10, 11, 13, 15, 17};

// Sanity Constants
const int TO_COLD = -2;
const int TO_HOT = 50;

// Output - Control Relays NB! On means that the temperature is too hot and cooling is active.
const int OUTPUT_ZONE[] {1, 2, 3, 4, 5};

// Analog Inputs - Read potmeters to set desired temperature for each chamber.
const int INPUT_ZONE[] {A1, A2, A3, A4, A5};

// Digital Inputs - Read temperature sensor
const int TEMPERATURE_ZONE[] {6, 7, 8, 9, 10};

// Variables
float set_temperature[ZONES];
float read_temperature[] = {20, 20, 20, 20, 20};
bool relay_state[] = {LOW, LOW, LOW, LOW, LOW};
// Recursice LowPass filtering on read temperatuer
const float delta = 0.9;

void setup() {
  Serial.begin(9600);
  for (int i = 0; i < ZONES; i++) {
    pinMode(INPUT_ZONE[i],       INPUT);
    pinMode(OUTPUT_ZONE[i],      OUTPUT);
    pinMode(TEMPERATURE_ZONE[i], INPUT);
    digitalWrite(OUTPUT_ZONE[i], LOW);
  }
}

void loop() {
  for (int i = 0; i < ZONES; i++) {
    set_temperature[i] = get_set_temp(i);
    read_temperature[i] = get_temp(i);
    // If relay is not on and temperature is too hot. Turn on relay to enable cooling
    if (!relay_state[i] and ((read_temperature[i] - set_temperature[i]) > HYSTERESIS)) {
      digitalWrite(OUTPUT_ZONE[i], HIGH);
      relay_state[i] = HIGH;
    // If relay is on and temperature is too low. Turn off relay.
    } else if (relay_state[i] and ((read_temperature[i] - set_temperature[i]) < -HYSTERESIS)) {
      digitalWrite(OUTPUT_ZONE[i], LOW);
      relay_state[i] = LOW;
    }
  }
  delay(1000);
  debug();
}

float get_temp(int i) {
  // Read input from temp sensor and compute temperature in Celcius. Smoothe signal with an LP-filter.
  int raw = analogRead(TEMPERATURE_ZONE[i]);
  float raw_temp = raw * 1; // TODO: Fix this, get the correct info from datasheet
  // Sanity check:
  if (raw_temp < TO_COLD or raw_temp > TO_HOT){
    raw_temp = MIN[i] - 1; // Turn relay off if temperature sensor is broken.
  }
  float smooth_temp = (raw_temp * delta + read_temperature[i] * (1 - delta));
  return smooth_temp;
}

int get_set_temp(int i) {
  // Read input from potmeters to determin the desired set-temp for each chamber.
  float set_temp = (MAX[i] - MIN[i]) * (analogRead(INPUT_ZONE[i]) / 1023.0) + MIN[i];
  // Sanity check:
  if (set_temp < TO_COLD or set_temp > TO_HOT){
    set_temp = TO_HOT; // Turn relay off if temperature sensor is broken.
  }
  return set_temp;
}

void debug() {
  Serial.print("Set temperatures:      ");
  Serial.print("[");
  for (int i = 0; i < ZONES - 1; i++) {
    Serial.print(set_temperature[i]);
    Serial.print(",");
  }
  Serial.print(set_temperature[ZONES - 1]);
  Serial.println("]");

  Serial.print("Measured temperatures: ");
  Serial.print("[");
  for (int i = 0; i < ZONES - 1; i++) {
    Serial.print(read_temperature[i]);
    Serial.print(",");
  }
  Serial.print(read_temperature[ZONES - 1]);
  Serial.println("]");

  Serial.print("Diff temperatures:     ");
  Serial.print("[");
  for (int i = 0; i < ZONES - 1; i++) {
    Serial.print(read_temperature[i] - set_temperature[i]);
    Serial.print(",");
  }
  Serial.print(read_temperature[ZONES - 1] - set_temperature[ZONES -1]);
  Serial.println("]");

  Serial.print("Relay status:          ");
  Serial.print("[");
  for (int i = 0; i < ZONES - 1; i++) {
    Serial.print(relay_state[i]);
    Serial.print(",");
  }
  Serial.print(relay_state[ZONES - 1]);
  Serial.println("]");

  Serial.println("");
  Serial.println("");
}
