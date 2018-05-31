---
title: "README"
author: "Omprakash Samudrala"
date: "May 30, 2018"
output: 
  md_document:
    variant: Markdown_github
---

# CSX415 Project - VorTeq Erosion Risk Prediction

## Brief Summary

The main objective of the project was to determine the risk posed to the VorTeq missile (used in hydrocarbon extraction) by erosion. The erosion risk is quantified into a single variable called the erosion potential. If the erosion potential exceeds **0.3**, there is a high risk of VorTeq failure. Refer to the formal problem statement in the reports section for more details

The erosion potential is dependent on 25 features - number of currently operating rotary pressure exchangers (RPXs) - max of 12, the process flow through each of them - 12 process flows (if a particular RPX is not operational, flow is given as zero) and the motive flow through each of the RPXs - 12 motive flows.

The VorTeq Erosion model predicts the erosion potential at any operating condition and informs the user if the erosion risk at the current operating state is high or low.

Project assets are provided in the **assets.md** file

Refer to the **README.md** file under the deploy folder for more information on how to use the erosion predictor

