## Instalation:

### **1. Ensure All Dependencies Are Installed**

Before installing the BHD Bridge, make sure the following dependencies are downloaded and added to your `resources` folder:

- **ox_lib**  
- **oxmysql**  

Ensure these dependencies are started **before** the BHD Bridge in your `server.cfg`:

```plaintext
ensure ox_lib
ensure oxmysql
```

---

### **2. Add BHD Bridge to Resources**

1. **Download the BHD Bridge**: Obtain the latest version of the BHD Bridge from your source.  
2. **Place in Resources**: Move the `bhd_bridge` folder into your server's `resources` directory.  
   - **Important**: To avoid boot order issues, do not place the bridge within a subfolder.  

---

### **3. Configure Server Startup Order**

In your `server.cfg`, ensure that the BHD Bridge is started **after** your framework and target scripts, but **before** any scripts that depend on it:

- **For ESX Framework**:

  ```plaintext
  ensure es_extended
  ensure ox_target  # or your target script
  ensure bhd_bridge
  ```

- **For QB-Core Framework**:

  ```plaintext
  ensure qb-core
  ensure qb-target  # or your target script
  ensure bhd_bridge
  ```

- **Note**: Start the bridge after any scripts it may use exports from, such as inventories or targets.

---

### **4. Verify Installation**

After configuring your `server.cfg`:

1. **Restart Your Server**: Apply the changes by restarting the server.  
2. **Check Console for Errors**: Monitor the server console to ensure there are no errors related to the BHD Bridge or its dependencies.  

---

By following these steps, the BHD Bridge should be correctly installed and operational on your server.
