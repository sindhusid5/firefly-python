 # Student Record Management System

## Overview

This project features a Solidity smart contract and a Python-based Gradio interface for managing student records. The smart contract enables the creation, reading, updating, and deletion of student records on the Ethereum blockchain. The Gradio interface provides an intuitive front end for interacting with the smart contract.

### Smart Contract Details

- **Contract Name**: `StudentRecord`
- **License**: MIT
- **Compiler Version**: `^0.8.0`

The `StudentRecord` smart contract offers the following functionalities:
- **Create a Student Record**: Adds a new student record to the blockchain.
- **Read a Student Record**: Retrieves details of a student based on their ID.
- **Update a Student Record**: Modifies an existing student's details.
- **Delete a Student Record**: Removes a student's record from the blockchain.

### Python Gradio Interface

The Python code utilizes the Gradio library to build a user interface for managing student records via the smart contract. The interface includes tabs for creating, reading, updating, and deleting student records.

## Prerequisites

Ensure you have the following installed before running the project:

- [Node.js](https://nodejs.org/)
- [Hardhat](https://hardhat.org/) for smart contract development and deployment
- [Python](https://www.python.org/downloads/) (3.6 or higher)
- [pip](https://pip.pypa.io/en/stable/installation/) (Python package manager)
- [Firefly](https://firefly.network/) for blockchain interactions (installation instructions below)

### Install Firefly

To install Firefly, follow the instructions on the [Firefly website](https://firefly.network/docs/installation) to set up your environment and configure Firefly.

### Firefly Deployment

1. **Initialize Firefly**:

    ```bash
    ff init ethereum sidstack 3 --org-name sidorg1 --org-name sidorg2 --org-name sidorg3 --node-name sidnode1 --node-name sidnode2 --node-name sidnode3
    ```

2. **Start Firefly**:

    ```bash
    ff start sidstack
    ```

### Python Libraries

Navigate to the project directory and install the required Python libraries using `pip`:

```bash
cd firefly-python
pip install gradio requests python-dotenv
```
or

```bash
pip3 install gradio requests python-dotenv
```

## Getting Started

### 1. Install Node.js Dependencies

Install the necessary Node.js modules:

```bash
npm install
```

### 2. Deploy the Smart Contract

1. Compile the `StudentRecord` smart contract using Hardhat:

    ```bash
    npx hardhat compile
    ```

2. Deploy the smart contract to the firefly:

    ```bash
    ff deploy ethereum sidstack artifacts/contracts/student.sol/StudentRecord.json
    ```

Note down the contract address after deployment.

### 3. Setup Environment Variables

Create a `.env` file in the root of the project directory and add your Firefly node URL:

```bash
FIREFLY_NODE_URL=<path_to_your_firefly_node_url>
```

### 4. Access Firefly UIs

- Web UI for member '0': [http://127.0.0.1:5000/ui](http://127.0.0.1:5000/ui)
- Swagger API UI for member '0': [http://127.0.0.1:5000/api](http://127.0.0.1:5000/api)
- Sandbox UI for member '0': [http://127.0.0.1:5109](http://127.0.0.1:5109)

### 5. Run the Gradio Interface

Launch the Gradio interface with the following command:

```bash
cd frontend
python app.py
```
or

```bash
python3 app.py
```

This command starts a local web server, and the Gradio interface will be accessible via your browser.

### 6. Interacting with the Smart Contract

Once the Gradio interface is running, you can use the tabs to:
- **Create Student**: Add a new student record.
- **Read Student**: Retrieve and display student details using their ID.
- **Update Student**: Modify an existing student's details.
- **Delete Student**: Remove a student's record from the blockchain.

### 7. Test the Interface

Use the Gradio interface to interact with the smart contract and ensure that all functions work as expected. The interface will provide JSON responses reflecting the results of your interactions with the smart contract.

## Firefly Integration

The Python script utilizes Firefly APIs to interact with the smart contract. Ensure that your Firefly node is correctly configured and running to handle requests from the Gradio interface.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Troubleshooting

If you encounter issues, ensure that:

- Your Firefly node is correctly configured and accessible.
- The contract address and Firefly node URL in the `.env` file are accurate.
- All necessary Python dependencies are installed.

## Conclusion

This project demonstrates a basic implementation of a student record management system using blockchain technology. The Gradio interface simplifies interactions with the smart contract, facilitating the creation, reading, updating, and deletion of student records.
 