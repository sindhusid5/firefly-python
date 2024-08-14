import gradio as gr
import requests
from dotenv import load_dotenv
import os

# Load environment variables (if you are using a .env file)
load_dotenv()

# Define the base URL for your FireFly API
firefly_node_url = os.getenv('FIREFLY_NODE_URL')

def create_student(id, name, age, grade, status):
    url = f"{firefly_node_url}/invoke/createStudent"
    data = {
        "input": {
            "id": id,
            "name": name,
            "age": age,
            "grade": grade,
            "status": status
        }
    }
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, json=data, headers=headers)
    return response.json()

def read_student(id):
    url = f"{firefly_node_url}/invoke/readStudent"
    data = {
        "input": {
            "id": id
        }
    }
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, json=data, headers=headers)
    return response.json()

def update_student(id, name, age, grade, status):
    url = f"{firefly_node_url}/invoke/updateStudent"
    data = {
        "input": {
            "id": id,
            "name": name,
            "age": age,
            "grade": grade,
            "status": status
        }
    }
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, json=data, headers=headers)
    return response.json()

def delete_student(id):
    url = f"{firefly_node_url}/invoke/deleteStudent"
    data = {
        "input": {
            "id": id
        }
    }
    headers = {"Content-Type": "application/json"}
    response = requests.post(url, json=data, headers=headers)
    return response.json()

# Define Gradio Interface for creating a student
create_student_iface = gr.Interface(
    fn=create_student,
    inputs=[
        gr.Textbox(label="Student ID", placeholder="Enter Student ID", lines=1),
        gr.Textbox(label="Name", placeholder="Enter Student Name", lines=1),
        gr.Number(label="Age", precision=0),
        gr.Textbox(label="Grade", placeholder="Enter Student Grade", lines=1),
        gr.Textbox(label="Status", placeholder="Enter Student Status", lines=1)
    ],
    outputs="json",
    title="Create Student Record"
)

# Define Gradio Interface for reading a student record
read_student_iface = gr.Interface(
    fn=read_student,
    inputs=[gr.Textbox(label="Student ID", placeholder="Enter Student ID", lines=1)],
    outputs="json",
    title="Read Student Record"
)

# Define Gradio Interface for updating a student record

update_student_iface = gr.Interface(
    fn=update_student,
    inputs=["text", "text", "number", "text", "text"],
    outputs="json",
    title="Update Student Record"
)

# Define Gradio Interface for deleting a student record
delete_student_iface = gr.Interface(
    fn=delete_student,
    inputs=[gr.Textbox(label="Student ID", placeholder="Enter Student ID", lines=1)],
    outputs="json",
    title="Delete Student Record"
)

# Create a Gradio Tabbed Interface
iface = gr.TabbedInterface(
    interface_list=[create_student_iface, read_student_iface, update_student_iface, delete_student_iface],
    tab_names=["Create Student", "Read Student", "Update Student", "Delete Student"]
)

iface.launch()


