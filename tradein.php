<h2>Trade-In Your Mobile</h2>

<form id="tradein-form" method="post" action="get_quote.php">
    <label for="brand">Select Brand:</label>
    <select name="brand" id="brand" required>
        <option value="">-- Select Brand --</option>
        <option value="apple">Apple</option>
        <option value="samsung">Samsung</option>
        <option value="xiaomi">Xiaomi</option>
        <option value="oneplus">OnePlus</option>
    </select>

    <br><br>

    <label for="model">Select Model:</label>
    <select name="model" id="model" required>
        <option value="">-- Select Model --</option>
    </select>

    <br><br>

    <label for="condition">Phone Condition:</label>
    <select name="condition" required>
        <option value="">-- Select Condition --</option>
        <option value="like_new">Like New</option>
        <option value="good">Good</option>
        <option value="fair">Fair</option>
        <option value="broken">Broken</option>
    </select>

    <br><br>

    <input type="submit" value="Get Quote">
</form>

<script>
// JavaScript to update models based on selected brand
const models = {
    apple: ["iPhone 14", "iPhone 13", "iPhone 12", "iPhone SE"],
    samsung: ["Galaxy S22", "Galaxy S21", "Galaxy Note 20", "Galaxy A52"],
    xiaomi: ["Redmi Note 11", "Mi 11X", "Poco X3", "Redmi 10"],
    oneplus: ["OnePlus 11", "OnePlus 10 Pro", "OnePlus Nord", "OnePlus 8T"]
};

document.getElementById('brand').addEventListener('change', function() {
    const brand = this.value;
    const modelSelect = document.getElementById('model');
    modelSelect.innerHTML = '<option value="">-- Select Model --</option>';
    
    if (models[brand]) {
        models[brand].forEach(model => {
            const opt = document.createElement('option');
            opt.value = model;
            opt.textContent = model;
            modelSelect.appendChild(opt);
        });
    }
});
</script>