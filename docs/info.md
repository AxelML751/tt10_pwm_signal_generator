<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The modules of this device communicate via control and data signals. The prescaler sends the reduced frequency clock (clk_out) to both the PWM control and the PWM generator. The frequency of clk_out can be adjusted through the Conf input. The duty cycle is controlled through the xu and xd inputs, which, via the previously described module, send the duty cycle value (Npwm) to the PWM generator. The PWM generator then produces the PWM signal (pwm), which is the system's output. In Fig. 8 the connections of the device are shown.

![image](https://github.com/user-attachments/assets/d9898afd-636e-48d9-b01a-2234c6b72a2f)
![image](https://github.com/user-attachments/assets/44303c03-e9af-4fcb-b656-4540687097f1)

 Three modules are designed to construct the PWM signal generator device: the prescaler, duty cycle adjustment, and PWM generator. Fig. 2 depicts the general block diagram.

 ![image](https://github.com/user-attachments/assets/67ead29d-4d5e-4041-8b4a-6fafde08c48e)

The prescaler is an important module in the system (see Fig. 3), as it reduces the main clock frequency to generate a lower-frequency clock, allowing the PWM signal frequency to be adjusted. This module uses D-type and T-type flip-flops to synchronize and control the output signal. Additionally, it includes a multiplexer that selects the desired frequency based on the configuration through the 3-bit Conf input, allowing the base clock frequency to be reduced by up to a factor of 1:32, as shown in Table 2.

![image](https://github.com/user-attachments/assets/e5aeb19d-179b-4f2b-8762-87f8539aa1f6)

The Prescaler module employs a decoder to enable the different clock dividers, allowing their activation only when used. This decoder architecture is shown in Fig. 4.

![image](https://github.com/user-attachments/assets/d841a34c-8e37-4206-800a-3d077871768c)
![image](https://github.com/user-attachments/assets/f2760ded-4735-4a4e-8bc5-1e839ab29ee9)

The duty cycle adjustment module (see Fig. 5) is responsible for adjusting the duty cycle of the PWM signal based on the "xu" (increment) and "xd" (decrement) inputs. This module uses a finite state machine (FSM) to manage the transitions between different duty cycle values, allowing the duty cycle to be increased or decreased in steps of 10%. Additionally, it includes an adder that calculates the new duty cycle values and a multiplexer that selects the value to be incremented: 0 (no change), 10 (increment), or -10 (decrement), ensuring that the value stays within the allowed range of 0% to 100%. The FSM is of the Moore type and is summarized in the graph shown in Fig. 6. This module sends the final configured duty cycle value (Npwm) to the PWM generator, producing the modulated signal.

![image](https://github.com/user-attachments/assets/ac321989-4952-4756-8ccc-f6402373fbdc)

The transitions between these states are determined by control signals: xu, xd, cd, and cu. On this way, cd, and cu represents the following equality operations:
• 𝑐𝑢←(𝑌==100)
• 𝑐𝑑←(𝑌==0)
The outputs A, B, and C of the FSM represent:
• 𝐴:𝑆𝑒𝑙=00 (No change)
• 𝐵:𝑆𝑒𝑙=01 (Increment)
• 𝐶:𝑆𝑒𝑙=10 (Decrement)

![image](https://github.com/user-attachments/assets/21ee46fa-d677-4791-a783-95b63a52e163)

This module generates a PWM signal with a specified duty cycle. It uses an internal counter that increments its value on each clock cycle. The counter's value is compared to the specified duty cycle (Npwm) to determine the pulse width modulation. If the counter's value is less than Npwm, the PWM signal will output a high signal; otherwise, it will output a low signal. Additionally, the PWM generator includes a comparator that resets the counter when it reaches its maximum value of 99, ensuring that the PWM signal maintains an accurate duty cycle between 0% and 100%, with a resolution of 1%. Its architecture is depicted on Fig. 7.

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

