# Temperature Prediction Model

A MATLAB-based temperature prediction model developed using historical weather observations from Lappeenranta Airport, Finland.

This project combines Fourier analysis, polynomial regression, and linear least squares estimation to model seasonal temperature behaviour and evaluate prediction accuracy against real-world measurements.

Developed as part of the **HDD4060 Technical Computing Software** course.

---

## Project Overview

The objective of this project was to build a mathematical model capable of predicting daily average temperatures using approximately ten years of historical climatological data.

The model was trained using weather observations collected between 2014 and March 2024 and validated using actual temperature measurements from April 2024.

---

## Methodology

### Data Preparation

- Imported weather observations from Excel datasets
- Processed approximately 10 years of historical temperature data
- Handled missing observations using linear interpolation
- Generated a continuous daily timeline for modelling

### Mathematical Model

The model combines:

- Fourier analysis for yearly seasonal variation
- Second-degree polynomial regression for long-term trends
- Linear Least Squares (LLS) for parameter estimation

Model equation:

```text
T(t) = a₀ + a₁cos(ωt) + b₁sin(ωt) + p₁t + p₂t²
```

where:

```text
ω = 2π / 365.25
```

---

## Technologies Used

- MATLAB
- Linear Least Squares
- Fourier Modelling
- Polynomial Regression
- Data Interpolation
- Data Analysis
- Scientific Visualization

---

## Files

```text
lpr_weather.m
weather_report.pdf
README.md
```

### Contents

- `lpr_weather.m` — MATLAB implementation
- `weather_report.pdf` — Technical report describing methodology, analysis, and results

---

## Validation Results

The model was validated against actual temperatures recorded during April 2024.

### Performance

- Mean Square Error (MSE): **15.4243**
- Root Mean Square Error (RMSE): **≈ 3.93 °C**
- Historical dataset period: **2014–2024**
- Validation period: **April 2024**

The model successfully captured the overall seasonal warming trend but demonstrated the limitations of deterministic approaches when predicting highly variable daily weather behaviour.

---

## Skills Demonstrated

- MATLAB programming
- Numerical modelling
- Engineering data analysis
- Scientific computing
- Regression techniques
- Statistical evaluation
- Technical report writing
- Data visualization
- Problem solving

---

## Key Learning Outcomes

This project strengthened my understanding of:

- Mathematical modelling
- Linear least squares estimation
- Fourier-based seasonal analysis
- Weather and environmental data interpretation
- Validation of predictive models
- Translating engineering theory into software implementation

---

## Academic Context

Course:

**HDD4060 – Technical Computing Software**

Authors:

- Tuguldur Badarch
- Gabor Hegedus

The project investigated microscale temperature prediction for Lappeenranta using historical weather data from the Finnish Meteorological Institute (FMI).

---

## Future Improvements

Potential extensions include:

- Incorporating humidity measurements
- Including atmospheric pressure data
- Using wind speed and direction
- Applying machine learning methods
- Expanding the forecasting horizon
- Comparing against modern forecasting techniques

---

## Author

**Tuguldur Badarch**

B.Sc. Electrical Engineering Student

LUT University
