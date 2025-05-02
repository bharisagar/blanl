# ⁠get information from Jason file ( read the json file) and get the names ,age and branch details.
Let’s say you have a file called students.json with the following content:
[
  {
    "name": "Sagar",
    "age": 25,
    "branch": "Computer Science"
  },
  {
    "name": "aman", 
    "age": 24,
    "branch": "Electronics"
  }
]
# 2. Install jq 
sudo yum install -y jq   

# 3. Read the JSON file and extract the required fields
jq -r '.[] | "\(.name) \(.age) \(.branch)"' students.json #.[] says: "loop through each object in the array"
# \(.name) \(.age) \(.branch) says: "for each object, get the name, age, and branch"
# -r flag says: "output raw strings, not JSON-encoded strings" 
# This command will output:
# Sagar 25 Computer Science
# aman 24 Electronics
