// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ProductAuth {

    struct Product {
        string name;
        string manufacturer;
        bool isValid;
    }

    mapping(string => Product) public products;

    // ✅ Anyone can add product now
    function addProduct(
        string memory _id,
        string memory _name,
        string memory _manufacturer
    ) public {
        products[_id] = Product(_name, _manufacturer, true);
    }

    function verifyProduct(string memory _id)
        public
        view
        returns (string memory, string memory, bool)
    {
        Product memory p = products[_id];
        return (p.name, p.manufacturer, p.isValid);
    }
}