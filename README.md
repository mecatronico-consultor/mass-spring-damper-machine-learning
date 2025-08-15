# mass-spring-damper-machine-learning
This project uses a trained Machine Learning (ML) model in MATLAB to predict the equilibrium point of a mass-spring-damper mechanical system. The model predicts the equilibrium position ( x _eq ) from the system's properties ( m , c , k ) and the applied force ( F ). The code includes a comparison with the analytical calculation.

## 🚀 Getting Started
To use this project, follow these steps:

* Open MATLAB.

* Navigate to the project directory in the MATLAB interface.

* Run the script:
  Make sure the model file modelo_mecanico.mat is in the same directory. Then, simply run prediction_script.m (you can change the file name if it's different).

## 📄 Repository Contents
* prediction_script.m: The main MATLAB script that loads the model, defines new data, and performs the prediction.

* modelo_mecanico.mat: The Machine Learning model file exported from the MATLAB Machine Learning App. (Note: This file must be included in the repository)

* mass_spring_damper_dataset_resuelto_con_encabezados.csv: The dataset used to train the model, provided for reference and transparency.

## ⚙️ Prediction Parameters
The script allows you to easily modify the system parameters to get a new prediction. You can adjust the following variables in the "Create new data for prediction" section:

* nueva_masa:	Mass of the object (m)
* nuevo_amortiguamiento	Damping coefficient (c)
* nueva_rigidez	Spring constant (k)
* nueva_fuerza	Applied force (F)

## Exportar a Hojas de cálculo
💡 How the Model Works
The ML model has been trained to find the relationship between the input variables (masa_m, amortiguamiento_c, rigidez_k, fuerza_F) and the output variable, which is the equilibrium point (x_eq).

The equilibrium point is defined as the position where the spring force balances the applied external force, which is described by the analytical formula:
x_eq = F/k
​

The script uses this formula to verify the accuracy of the ML model.
