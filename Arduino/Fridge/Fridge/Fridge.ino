/*
   I have a gap. A gap between my fridge and my wall, currently I fill it with the storage of two drying racks
   Let's utelize it a bit better by building a Wine, vegetable and cheese cabinet.

   Joachim Spange KodeWorks, house day 7th July 2023
*/

const int ZONES = 5;
const int HYSTERESIS = 1;  // +/- Lag relative to set point before a change is made.
// Temperature span for each zone in Celcius
const float MIN[] = {5, 6, 8, 10, 12};
const float MAX[] = {10, 11, 13, 15, 17};

// Output - Control Relays NB! On means that the temperature is too hot and cooling is active.
const int OUTPUT_ZONE[] {1, 2, 3, 4, 5};

// Analog Inputs - Read potmeters
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
    set_temperature[i] = (MAX[i] - MIN[i]) * (analogRead(INPUT_ZONE[i]) / 1023.0) + MIN[i];
    read_temperature[i] = (analogRead(TEMPERATURE_ZONE[i]) * delta + read_temperature[i] * (1 - delta)); // TODO: Fix this
    // If relay is not on and temperature is too hot. Turn on relay to enable cooling
    if (!relay_state[i] and ((read_temperature[i] - set_temperature[i]) > HYSTERESIS)) {
      digitalWrite(OUTPUT_ZONE[i], HIGH);
      relay_state[i] = HIGH;
      // If relay is on and temperature is too low. Turn off relay.
    } else if (relay_state[i] and ((read_temperature[i] - set_temperature[i]) < HYSTERESIS)) {
      digitalWrite(OUTPUT_ZONE[i], LOW);
      relay_state[i] = LOW;
    }
  }
  delay(100);
}
