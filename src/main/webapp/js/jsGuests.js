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

function removeAccentsBeforeSubmit() {
    // Lấy tất cả các input cần xử lý
    const inputsToNormalize = ["diem-di", "diem-den"];
    
    // Duyệt qua từng input và loại bỏ dấu
    inputsToNormalize.forEach(inputId => {
        const inputElement = document.getElementById(inputId);
        if (inputElement) {
            inputElement.value = removeAccents(inputElement.value);
        }
    });
}

// Hàm loại bỏ dấu tiếng Việt
function removeAccents(str) {
    return str
	    .normalize("NFD") // Chuẩn hóa chuỗi thành dạng NFD để phân tách ký tự và dấu
	    .replace(/[\u0300-\u036f]/g, "") // Loại bỏ các dấu
	    .replace(/đ/g, "d") // Chuyển đ thành d
	    .replace(/Đ/g, "D"); // Chuyển Đ thành D
}

// Hàm xử lý autocomplete
function handleAutocomplete(inputId, suggestionsId) {
    const input = document.getElementById(inputId);
    const suggestions = document.getElementById(suggestionsId);

    input.addEventListener("input", function () {
        const query = removeAccents(input.value.toLowerCase().trim());
        suggestions.innerHTML = ""; // Xóa các gợi ý cũ

        if (query) {
            // Lọc các tỉnh có chứa chữ người dùng nhập (không dấu)
            const filteredProvinces = provinces.filter(province =>
                removeAccents(province.toLowerCase()).includes(query)
            );

            // Tạo danh sách gợi ý
            filteredProvinces.forEach(province => {
                const suggestion = document.createElement("div");
                suggestion.className = "autocomplete-suggestion";
                suggestion.textContent = province;
                suggestion.addEventListener("click", () => {
                    input.value = province; // Điền giá trị vào ô input
                    suggestions.innerHTML = ""; // Xóa gợi ý
                });
                suggestions.appendChild(suggestion);
            });
        }
    });
}

// Gọi hàm xử lý autocomplete cho Điểm đi và Điểm đến
handleAutocomplete("diem-di", "suggestions-diem-di");
handleAutocomplete("diem-den", "suggestions-diem-den");