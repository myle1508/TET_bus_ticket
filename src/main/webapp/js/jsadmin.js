// Danh sách các tỉnh Việt Nam
const provinces = [
    "An Giang", "Bà Rịa - Vũng Tàu", "Bạc Liêu", "Bắc Giang", "Bắc Kạn", "Bắc Ninh",
    "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau",
    "Cần Thơ", "Cao Bằng", "Đà Nẵng", "Đắk Lắk", "Đắk Nông", "Điện Biên", "Đồng Nai",
    "Đồng Tháp", "Gia Lai", "Hà Giang", "Hà Nam", "Hà Nội", "Hà Tĩnh", "Hải Dương",
    "Hải Phòng", "Hậu Giang", "Hòa Bình", "Hưng Yên", "Khánh Hòa", "Kiên Giang",
    "Kon Tum", "Lai Châu", "Lâm Đồng", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định",
    "Nghệ An", "Ninh Bình", "Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình",
    "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị", "Sóc Trăng", "Sơn La",
    "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hóa", "Thừa Thiên Huế", "Tiền Giang",
    "TP. Hồ Chí Minh", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái"
];

// Hàm khởi tạo danh sách tỉnh
function populateProvinces(selectId) {
    const select = document.getElementById(selectId);
    provinces.forEach(province => {
        const option = document.createElement("option");
        option.value = province;
        option.textContent = province;
        select.appendChild(option);
    });
}

// Hàm kiểm tra tuyến đường
function checkRoute() {
    const start = document.getElementById("diem_xuat_phat").value;
    const end = document.getElementById("diem_ket_thuc").value;
    const errorField = document.getElementById("id-error");
    const submitButton = document.querySelector("button[type='submit']");
    const distanceField = document.getElementById("khoang_cach");
    const priceField = document.getElementById("gia_ve");

    if (!start || !end || start === end) {
        errorField.textContent = "Điểm xuất phát và điểm kết thúc không được trùng nhau.";
        submitButton.disabled = true;
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("GET", `admin?action=check_tuyen_duong&diem_xuat_phat=${encodeURIComponent(start)}&diem_ket_thuc=${encodeURIComponent(end)}`, true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            const response = JSON.parse(xhr.responseText);
            if (response.exists) {
                errorField.textContent = "Tuyến đường đã tồn tại.";
                submitButton.disabled = true;
                distanceField.disabled = true;
                priceField.disabled = true;
            } else {
                errorField.textContent = "";
                submitButton.disabled = false;
                distanceField.disabled = false;
                priceField.disabled = false;
            }
        }
    };

    xhr.send();
}

// Khởi tạo danh sách tỉnh cho các ô chọn
populateProvinces("diem_xuat_phat");
populateProvinces("diem_ket_thuc");
