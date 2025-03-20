以下是对`TaskOnePro.java`代码的详细解释和注释，旨在让不懂代码的人也能理解其功能和逻辑。

---

### **类概述**

`TaskOnePro` 是一个 Java 类，用于处理与任务（`taskone` 表）相关的业务逻辑。它提供了多种方法来查询、插入、更新任务数据，并支持分页显示和条件筛选。

---

### **成员变量**

```java
private Connection ct = null; // 数据库连接对象
private ResultSet rs = null; // 查询结果集对象
private PreparedStatement sta = null; // 预编译 SQL 语句对象
private int rowCount; // 总记录数
private int pageSize = 10; // 每页显示的记录数，默认为 10
private int pageCount; // 总页数
```

- **`Connection ct`**: 用于连接数据库。
- **`ResultSet rs`**: 存储从数据库查询到的结果。
- **`PreparedStatement sta`**: 执行预编译的 SQL 语句。
- **`rowCount`**: 统计表中总共有多少条记录。
- **`pageSize`**: 每页显示的记录数量。
- **`pageCount`**: 根据总记录数和每页显示数量计算出的总页数。

---

### **方法详解**

#### 1. **按时间范围分页查询任务**

```java
public ArrayList<TaskOne> getTaskPageByTime(int pageNow, String date1, String date2)
```

**功能**: 根据指定的时间范围（`date1` 和 `date2`），分页查询任务数据。

**步骤**:

- 将传入的字符串日期转换为 `Date` 类型。
- 构造 SQL 查询语句，筛选 `assigndate` 在 `date1` 和 `date2` 范围内的任务。
- 使用 `LIMIT` 子句实现分页查询。
- 将查询结果封装为 `TaskOne` 对象并存储在 `ArrayList` 中返回。

**注意**:

- 当前代码中存在重复调用 `rs.next()` 的问题，会导致部分数据丢失。应删除内层的 `while (rs.next())`。

---

#### 2. **获取总页数**

```java
public int getPageCount()
```

**功能**: 计算任务表中的总页数。

**步骤**:

- 查询任务表中的总记录数。
- 根据总记录数和每页显示的数量计算总页数：
  - 如果总记录数能被每页数量整除，则总页数为 `总记录数 / 每页数量`。
  - 否则，总页数为 `总记录数 / 每页数量 + 1`。

---

#### 3. **按状态分页查询任务**

```java
public ArrayList<TaskOne> getTaskByStatus(int pageNow, int status)
```

**功能**: 根据任务状态（`status`）分页查询任务数据。

**步骤**:

- 构造 SQL 查询语句，筛选 `status` 等于指定值的任务。
- 使用 `LIMIT` 子句实现分页查询。
- 将查询结果封装为 `TaskOne` 对象并存储在 `ArrayList` 中返回。

---

#### 4. **按级别分页查询任务**

```java
public ArrayList<TaskOne> getTaskByLevel(int pageNow, int level)
```

**功能**: 根据任务级别（`level`）分页查询任务数据。

**步骤**:

- 构造 SQL 查询语句，筛选 `level` 等于指定值的任务。
- 使用 `LIMIT` 子句实现分页查询。
- 将查询结果封装为 `TaskOne` 对象并存储在 `ArrayList` 中返回。

---

#### 5. **分页查询所有任务**

```java
public ArrayList<TaskOne> getTasksByPage(int pageNow)
```

**功能**: 分页查询任务表中的所有任务。

**步骤**:

- 构造 SQL 查询语句，查询所有任务。
- 使用 `LIMIT` 子句实现分页查询。
- 将查询结果封装为 `TaskOne` 对象并存储在 `ArrayList` 中返回。

---

#### 6. **更新任务状态**

```java
public boolean updateTask(int taskid)
```

**功能**: 更新指定任务的状态为 `1`。

**步骤**:

- 构造 SQL 更新语句，将 `status` 设置为 `1`。
- 执行更新操作。
- 如果影响的行数为 `1`，返回 `true`，否则返回 `false`。

---

#### 7. **插入新任务**

```java
public boolean addTask(String tasktype, java.util.Date assignDate, int status, String content, int companyid, int level)
```

**功能**: 向任务表中插入一条新任务。

**步骤**:

- 构造 SQL 插入语句，包含任务类型、分配日期、状态、内容、公司 ID 和级别等字段。
- 执行插入操作。
- 如果影响的行数为 `1`，返回 `true`，否则返回 `false`。

---

#### 8. **关闭数据库资源**

```java
public void closeM()
```

**功能**: 关闭数据库连接、结果集和预编译语句对象。

**步骤**:

- 检查每个资源是否为空。
- 如果不为空，则尝试关闭资源并捕获可能的异常。

---

### **总结**

`TaskOnePro` 类的主要功能是通过数据库操作实现对任务数据的增删改查，并支持分页查询和条件筛选。以下是它的核心特点：

1. **分页查询**: 提供了多种分页查询方法，支持按时间范围、状态、级别等条件筛选。
2. **数据操作**: 包括插入新任务和更新任务状态。
3. **资源管理**: 在每个方法的最后调用 `closeM()` 方法，确保数据库资源被正确释放。

通过这些方法，开发者可以方便地管理和展示任务数据，适用于需要分页显示或条件筛选的场景。
