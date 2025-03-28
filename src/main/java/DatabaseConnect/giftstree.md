好的，根据您的需求，我将只提供礼品表 (Gifts) 和兑换记录表 (ExchangeRecords) 的数据库设计和相应的 SQL 创建语句。

### 数据库设计

1. **礼品表 (Gifts)**

   - 礼品ID (GiftID) - 主键
   - 礼品名称 (GiftName)
   - 所需积分 (RequiredPoints)
   - 库存 (Stock)
2. **兑换记录表 (ExchangeRecords)**

   - 记录ID (RecordID) - 主键
   - 用户ID (UserID) - 外键，假设用户表存在
   - 礼品ID (GiftID) - 外键，关联礼品表
   - 兑换时间 (ExchangeTime)

### SQL 创建语句

```sql
CREATE TABLE Gifts (
    GiftID INT PRIMARY KEY AUTO_INCREMENT,
    GiftName VARCHAR(255) NOT NULL,
    RequiredPoints INT NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE ExchangeRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    GiftID INT,
    ExchangeTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GiftID) REFERENCES Gifts(GiftID)
);
```

### 解释

- **Gifts 表** 存储了所有可兑换的礼品信息，包括每个礼品所需的积分和当前库存。
- **ExchangeRecords 表** 记录了用户的兑换历史，包括用户ID、礼品ID和兑换时间。

请注意，`ExchangeRecords` 表中的 `UserID` 字段假设有一个对应的 `Users` 表存在。如果 `Users` 表不存在，您可以根据实际需求决定是否创建该表或移除外键约束。
