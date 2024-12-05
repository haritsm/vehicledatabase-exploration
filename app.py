from flask import Flask, request, jsonify
import duckdb

app = Flask(__name__)
db_connection = duckdb.connect("dbt_workspace/vehicle_database/data/vehicle_database.db")

@app.route('/query', methods=['POST'])
def query():
    if request.method == 'POST':
        sql_query = request.json.get("query")
        
    elif request.method == 'GET':
        # Extract query from the URL parameters for GET requests
        sql_query = request.args.get("query")

    try:
        result = db_connection.execute(sql_query).fetchall()
        return jsonify(result)
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == "__main__":
    app.run(host="localhost", port=8080)