<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The modules of this device communicate via control and data signals. The prescaler sends the reduced frequency clock (clk_out) to both the PWM control and the PWM generator. The frequency of clk_out can be adjusted through the Conf input. The duty cycle is controlled through the xu and xd inputs, which, via the previously described module, send the duty cycle value (Npwm) to the PWM generator. The PWM generator then produces the PWM signal (pwm), which is the system's output. In Fig. 8 the connections of the device are shown.

![image](https://github.com/user-attachments/assets/d9898afd-636e-48d9-b01a-2234c6b72a2f)
![image](https://github.com/user-attachments/assets/f8b0f9e3-eb3d-4c94-b1b3-0be27f994f67)
Its operation is described below.
1. Connecting the device:
  • Connect a 4 MHz clock signal to the clk input.
  • Connect the suggested components as depicted in Fig. 9.
  • Ensure the power supply is connected to Vdd.
2. Setting the frequency:
  • Deactivate the module. Reach this by setting the enable to 0 and, momentarily, set the reset to 1.
  • Configure the PWM signal frequency, configuring the Conf input in concordance with Table 2.
  • Activate the module setting the enable to 1.
3. Adjusting the duty cycle:
  • To increase the duty cycle, activate momentarily the up input to increase the duty cycle by 10%. Repeat as necessary.
  • To decrease the duty cycle, activate momentarily the down input to reduce the duty cycle by 10%. Repeat as necessary.
    If you need to adjust again the PWM signal frequency, restart the process in the step 2.



## How to test
To visualize the PWM signal and verify its generation, an oscilloscope with at least one probe is necessary. The only requirement for accurately visualizing the signal is that the oscilloscope must have a bandwidth of at least 5 MHz.
10
To correctly visualize the signal, follow step 1 shown above, and then connect the oscilloscope probe to the PWM output. Refer to the user manual to connect and configure the oscilloscope being used. Proceed with the following steps to interact with the PWM signal and verify its generation. You must visualize a waveform as depicted in Fig. 10.

![image](https://github.com/user-attachments/assets/2ef6ecc9-d6fa-4419-b2ef-d1ba8eba69e9)



## External hardware

The application of PWM signals is quite diverse, with one of the most common being the control of DC motor speed. Thus, implementing a speed control system for a small DC motor using this module is easy to achieve. Simply implement the block diagram shown in Fig. 11.

![image](https://github.com/user-attachments/assets/1a0e977b-5be9-460f-ac0f-34755d68efeb)

Note that the diagram is divided into two stages: the control stage and the power stage. On the one hand, the connections in the control stage are the same as those shown previously. On the other hand, the connections in the power stage will depend on the driver and the DC motor used. Fig. 12 shows an example of power stage connections using an L298N H-bridge (driver) and a 9V DC motor.

![image](https://github.com/user-attachments/assets/3e031e67-de7e-4d47-ba2d-d1b090334652)

Operate the PWM signal generator device, and you should obtain different speeds as the pulse width is modified. Remember for proper control, it is recommended to choose the PWM frequency according to the following formula. 
𝑓𝑝𝑤𝑚>5/2𝜋𝜏
where 𝜏 is the time constant of the DC motor.

