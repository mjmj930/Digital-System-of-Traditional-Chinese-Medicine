from neo4j import GraphDatabase

# Neo4j数据库连接信息
uri = "bolt://localhost:7687"
username = "root"
password = "123456"

# 连接Neo4j数据库
driver = GraphDatabase.driver(uri, auth=(username, password))

# 创建节点和关系
def create_graph(tx):
    # 创建中药材节点
    tx.run("CREATE (:Herb {name: $name, category: $category})", name="药材名称", category="药材分类")

    # 创建药性节点
    tx.run("CREATE (:Property {name: $name})", name="药性名称")

    # 创建归经节点
    tx.run("CREATE (:Tropism {name: $name})", name="归经名称")

    # 创建药材之间的归属关系
    tx.run("MATCH (h1:Herb {name: $herb1}), (h2:Herb {name: $herb2}) "
           "CREATE (h1)-[:BELONGS_TO]->(h2)", herb1="药材1", herb2="药材2")

    # 创建药材之间的相克相宜关系
    tx.run("MATCH (h1:Herb {name: $herb1}), (h2:Herb {name: $herb2}) "
           "CREATE (h1)-[:COMPLEMENT]->(h2)", herb1="药材1", herb2="药材2")

# 执行创建图谱操作
with driver.session() as session:
    session.write_transaction(create_graph)
