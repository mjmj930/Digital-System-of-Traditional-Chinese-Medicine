from neo4j import GraphDatabase

# Neo4j���ݿ�������Ϣ
uri = "bolt://localhost:7687"
username = "root"
password = "123456"

# ����Neo4j���ݿ�
driver = GraphDatabase.driver(uri, auth=(username, password))

# �����ڵ�͹�ϵ
def create_graph(tx):
    # ������ҩ�Ľڵ�
    tx.run("CREATE (:Herb {name: $name, category: $category})", name="ҩ������", category="ҩ�ķ���")

    # ����ҩ�Խڵ�
    tx.run("CREATE (:Property {name: $name})", name="ҩ������")

    # �����龭�ڵ�
    tx.run("CREATE (:Tropism {name: $name})", name="�龭����")

    # ����ҩ��֮��Ĺ�����ϵ
    tx.run("MATCH (h1:Herb {name: $herb1}), (h2:Herb {name: $herb2}) "
           "CREATE (h1)-[:BELONGS_TO]->(h2)", herb1="ҩ��1", herb2="ҩ��2")

    # ����ҩ��֮���������˹�ϵ
    tx.run("MATCH (h1:Herb {name: $herb1}), (h2:Herb {name: $herb2}) "
           "CREATE (h1)-[:COMPLEMENT]->(h2)", herb1="ҩ��1", herb2="ҩ��2")

# ִ�д���ͼ�ײ���
with driver.session() as session:
    session.write_transaction(create_graph)
