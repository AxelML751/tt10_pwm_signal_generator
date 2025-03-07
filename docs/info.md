<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This device generates a Pulse Width Modulated (PWM) signal with configurable frequencies ranging from 1.25 kHz to 40 kHz and a duty cycle adjustable in 10% increments. The frequency is set using the 'Conf' input, while the 'xu' and 'xd' inputs allow increasing and decreasing the duty cycle, respectively. The device's connections are shown in the figure below.

![image](https://github.com/user-attachments/assets/f2834080-5e74-4364-98dc-6939c1e2f59b)



Fig. 1. Connections of the PWM signal generator.

The pinout description is presented in Table 1.

Table 1. Pinout description.

![image](https://github.com/user-attachments/assets/69108114-bd06-4ca4-b10a-eae84fffdcbf)

Three modules were designed to construct the PWM signal generator device: the prescaler, duty cycle adjustment, and PWM generator. Fig. 2 depicts the block diagram of the device.

![image](https://github.com/user-attachments/assets/78aacb57-b77c-4e7f-93a3-065c228d31ce)

Fig. 2. Block diagram of the PWM signal generator.

1. The prescaler is a module designed to reduce the primary clock frequency, enabling the adjustment of the PWM signal frequency. It uses D-type and T-type flip-flops to synchronize and control the output clock signal by dividing the input frequency. This module reduces the primary clock frequency by up to 1:32. The implemented architecture is depicted in Fig. 3.

![image](https://github.com/user-attachments/assets/5e4226dd-8cf4-40fe-81ae-ecfc83dade8b)


   Fig. 3. Prescaler architecture.

2.	The duty cycle adjustment module is responsible for adjusting the duty cycle of the PWM signal based on the "xu" (increment) and "xd" (decrement) inputs. This module uses a finite state machine (FSM, see Fig. 4) to manage the transitions between different duty cycle values, allowing the duty cycle to be increased or decreased in steps of 10%. The transitions between these states are determined by control signals: xu, xd, cd, and cu. On this way, cd, and cu represents the following equality operations:

     a.	𝑐𝑢 ← (𝑌 == 100)
  
     b.	𝑐𝑑 ← (𝑌 == 0)
  
     The outputs A, B, and C of the FSM represent:

       c.	A: No change
  
       d.	B: Increment
  
       e.	C: Decrement

![image](https://github.com/user-attachments/assets/b5500939-deb7-4e87-8c24-559818ac05ab)

Fig. 4. Finite state machine implemented for duty cycle control.

3. This module generates a PWM signal with a specified duty cycle. Its architecture is presented in Fig. 5. It uses an internal counter that increments its value on each clock cycle. The counter's value is compared to the specified duty cycle (Npwm) to determine the pulse width modulation. If the counter's value is less than Npwm, the PWM signal will output a high signal; otherwise, it will output a low signal. Additionally, the PWM generator includes a comparator that resets the counter when it reaches its maximum value of 99, ensuring that the PWM signal maintains an accurate duty cycle between 0% and 100%.

![image](https://github.com/user-attachments/assets/234849f5-f3e5-4583-8dac-3d5ba0325753)

Fig. 5. PWM generator architecture.

## How to test
The device can be tested connecting some components as Fig. 6 details.

![image](https://github.com/user-attachments/assets/fba5aea2-2590-47b5-adf1-b47484e50a70)


Fig. 6. Schematic of components connections for controlling the PWM signal generator device.

Its operation is described below.

1. Connecting the device:

      • Connect a 4 MHz clock signal to the clk input.

      • Connect the suggested components as depicted in Fig. 6.

      • Ensure the power supply is connected to Vdd.

2. Setting the frequency:
   
      • Deactivate the module. Reach this by setting the enable to 0 and, momentarily, set the reset to 1.

      • Configure the PWM signal frequency, configuring the Conf input in concordance with the following Table.

Table 2.PWM signal frequency configurations. [Note: base on clock input of 4 MHz]

![image](https://github.com/user-attachments/assets/7eb4912c-1326-4ddc-92dd-d2b6e3053884)

   • Activate the module setting the enable to 1.

3. Adjusting the duty cycle:
   
      • To increase the duty cycle, activate momentarily the up input to increase the duty cycle by 10%. Repeat as necessary.

      • To decrease the duty cycle, activate momentarily the down input to reduce the duty cycle by 10%. Repeat as necessary.

If you need to adjust again the PWM signal frequency, restart the process in step 2.

To visualize the PWM signal and verify its generation, an oscilloscope with at least one probe is necessary. So, follow step 1 shown above, and then connect the oscilloscope probe to the PWM output. Refer to the user manual to connect and configure the oscilloscope being used. Proceed with the following steps to interact with the PWM signal and verify its generation. You must visualize a waveform as depicted in Fig. 7.

![image](https://github.com/user-attachments/assets/bb7c6704-5cca-4622-9275-5c69d70fea98)

Fig. 7. Waveform generated by the PWM signal generator device.

DC Motor Speed Control

The implementation of a speed control system for a DC motor using this module is easy to achieve. Simply implement the block diagram shown in Fig. 8.

![image](https://github.com/user-attachments/assets/06864b50-c709-4644-90e0-6d0950da4054)

Fig. 8. Block diagram for speed control of a DC motor application.

Note that the diagram is divided into two stages: the control stage and the power stage. On the one hand, the connections in the control stage are the same as those shown previously. On the other hand, the connections in the power stage will depend on the driver and the DC motor used. Fig. 9 shows an example of power stage connections using an L298N H-bridge (driver) and a 9V DC motor.

![image](https://github.com/user-attachments/assets/fa230b06-1905-485f-b879-9ba9c34a1b01)

Fig. 9. Connection of power stage using L298N H-bridge and a 9V DC motor.

Operate the PWM signal generator device following the bellow steps, and you should obtain different speeds as the pulse width is modified. Remember for proper control, it is recommended to choose the PWM frequency according to the following formula.

fpwm>5/2𝜋𝜏

where 𝜏 is the time constant of the DC motor.

## External hardware
To ensure the correct functioning of the device, passive elements must be connected to the pins as shown in Fig. 6.

1. General Requirements: 

      • 7 resistors (10 kΩ).
   
      • 2 ceramic capacitors (100 nF).
   
      • 3 normally open push buttons.
   
      • 4 normally open switches.
   
      • Vdd power supply.

2. To Visualize the PWM Signal:

      • Oscilloscope with probes of at least 5 MHz bandwidth.

3. For DC Motor Speed Control:

      • DC motor.

      • DC motor driver compatible with PWM signals (e.g., L298N H-bridge).

      • DC motor power supply.




