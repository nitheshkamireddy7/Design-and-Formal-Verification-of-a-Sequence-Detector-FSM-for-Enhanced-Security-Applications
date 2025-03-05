# Secure Sequence Detector

## Overview
This project implements a secure sequence detector with built-in deadlock and isolation states for enhanced security and reliability. The design ensures that only valid sequences are detected while handling unexpected inputs robustly.

## Features
- **Secure Sequence Detection**: Identifies predefined sequences with strict validation.
- **Deadlock & Isolation States**: Protects the system from unintended states and potential security vulnerabilities.
- **Noise Mitigation**: Implements strategies to ensure stability and accuracy in detection.
- **Formal Verification**: Verified using Synopsys VC Formal suite to ensure correctness and reliability.

## Verification & Testing
- **Formal Verification**: Performed with Synopsys VC Formal suite to prove design correctness.
- **Testbench Implementation**: A comprehensive SystemVerilog testbench was created to validate functionality under various conditions.
- **Simulation & Debugging**: Simulated using industry-standard tools to ensure robustness.

## Usage
1. **Synthesize the Design**: Compile the Verilog/SystemVerilog files using a preferred synthesis tool.
2. **Run Simulation**: Use a simulation environment such as ModelSim or VCS to test the design.
3. **Perform Formal Verification**: Utilize Synopsys VC Formal suite to validate correctness.
4. **Analyze Results**: Review waveforms and logs to ensure proper sequence detection and noise mitigation.

## Future Enhancements
- Optimizing state transitions for reduced power consumption.
- Extending sequence detection capabilities for configurable patterns.
- Enhancing security features to detect tampering or anomalies.

## Contributors
- **[Nithesh Kamireddy]** - Design & Verification


## License
This project is open-source under the [License Name] license. See the LICENSE file for details.

