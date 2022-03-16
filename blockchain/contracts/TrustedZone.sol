// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        _setOwner(_msgSender());
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

library EnumerableSet {
    // To implement this library for multiple types with as little code
    // repetition as possible, we write it in terms of a generic Set type with
    // bytes32 values.
    // The Set implementation uses private functions, and user-facing
    // implementations (such as AddressSet) are just wrappers around the
    // underlying Set.
    // This means that we can only create new EnumerableSets for types that fit
    // in bytes32.

    struct Set {
        // Storage of set values
        bytes32[] _values;
        // Position of the value in the `values` array, plus 1 because index 0
        // means a value is not in the set.
        mapping(bytes32 => uint256) _indexes;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            // The value is stored at length-1, but we add 1 to all indexes
            // and use 0 as a sentinel value
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        // We read and store the value's index to prevent multiple reads from the same storage slot
        uint256 valueIndex = set._indexes[value];

        if (valueIndex != 0) {
            // Equivalent to contains(set, value)
            // To delete an element from the _values array in O(1), we swap the element to delete with the last one in
            // the array, and then remove the last element (sometimes called as 'swap and pop').
            // This modifies the order of the array, as noted in {at}.

            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;

            if (lastIndex != toDeleteIndex) {
                bytes32 lastvalue = set._values[lastIndex];

                // Move the last value to the index where the value to delete is
                set._values[toDeleteIndex] = lastvalue;
                // Update the index for the moved value
                set._indexes[lastvalue] = valueIndex; // Replace lastvalue's index to valueIndex
            }

            // Delete the slot where the moved value was stored
            set._values.pop();

            // Delete the index for the deleted slot
            delete set._indexes[value];

            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value] != 0;
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        return set._values[index];
    }

    /**
     * @dev Return the entire set in an array
     *
     * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
     * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
     * this function has an unbounded cost, and using it as part of a state-changing function may render the function
     * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
     */
    function _values(Set storage set) private view returns (bytes32[] memory) {
        return set._values;
    }

    // Bytes32Set

    struct Bytes32Set {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _add(set._inner, value);
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _remove(set._inner, value);
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(Bytes32Set storage set, bytes32 value) internal view returns (bool) {
        return _contains(set._inner, value);
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(Bytes32Set storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {
        return _at(set._inner, index);
    }

    /**
     * @dev Return the entire set in an array
     *
     * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
     * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
     * this function has an unbounded cost, and using it as part of a state-changing function may render the function
     * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
     */
    function values(Bytes32Set storage set) internal view returns (bytes32[] memory) {
        return _values(set._inner);
    }

    // AddressSet

    struct AddressSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(AddressSet storage set, address value) internal view returns (bool) {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    /**
     * @dev Returns the number of values in the set. O(1).
     */
    function length(AddressSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(AddressSet storage set, uint256 index) internal view returns (address) {
        return address(uint160(uint256(_at(set._inner, index))));
    }

    /**
     * @dev Return the entire set in an array
     *
     * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
     * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
     * this function has an unbounded cost, and using it as part of a state-changing function may render the function
     * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
     */
    function values(AddressSet storage set) internal view returns (address[] memory) {
        bytes32[] memory store = _values(set._inner);
        address[] memory result;

        assembly {
            result := store
        }

        return result;
    }

    // UintSet

    struct UintSet {
        Set _inner;
    }

    /**
     * @dev Add a value to a set. O(1).
     *
     * Returns true if the value was added to the set, that is if it was not
     * already present.
     */
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    /**
     * @dev Removes a value from a set. O(1).
     *
     * Returns true if the value was removed from the set, that is if it was
     * present.
     */
    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    /**
     * @dev Returns true if the value is in the set. O(1).
     */
    function contains(UintSet storage set, uint256 value) internal view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    /**
     * @dev Returns the number of values on the set. O(1).
     */
    function length(UintSet storage set) internal view returns (uint256) {
        return _length(set._inner);
    }

    /**
     * @dev Returns the value stored at position `index` in the set. O(1).
     *
     * Note that there are no guarantees on the ordering of values inside the
     * array, and it may change when more values are added or removed.
     *
     * Requirements:
     *
     * - `index` must be strictly less than {length}.
     */
    function at(UintSet storage set, uint256 index) internal view returns (uint256) {
        return uint256(_at(set._inner, index));
    }

    /**
     * @dev Return the entire set in an array
     *
     * WARNING: This operation will copy the entire storage to memory, which can be quite expensive. This is designed
     * to mostly be used by view accessors that are queried without any gas fees. Developers should keep in mind that
     * this function has an unbounded cost, and using it as part of a state-changing function may render the function
     * uncallable if the set grows to a point where copying to memory consumes too much gas to fit in a block.
     */
    function values(UintSet storage set) internal view returns (uint256[] memory) {
        bytes32[] memory store = _values(set._inner);
        uint256[] memory result;

        assembly {
            result := store
        }

        return result;
    }
}

contract TrustedZone is Ownable {

    using EnumerableSet for EnumerableSet.AddressSet;

    uint256 public organisationCount;

    struct Organisation {
        string name;
        EnumerableSet.AddressSet admins;
        EnumerableSet.AddressSet operators;
        bool active;
    }

    struct Info {
        string content;
        address[] editors;
        bool active;
    }

    mapping(uint256 => Organisation) private organisation;
    mapping(uint256 => mapping(uint256 => Info)) private info;

    modifier onlyAdmin(uint256 orgNumber) {
        require(organisation[orgNumber].active == true, "TrustedZone: inactive organization");
        require(isExistAdmin(orgNumber, _msgSender()), "TrustedZone: sender is not admin");
        _;
    }

    modifier onlyOperator(uint256 orgNumber) {
        require(organisation[orgNumber].active == true, "TrustedZone: inactive organization");
        require(isExistOperator(orgNumber, _msgSender()), "TrustedZone: sender is not operator");
        _;
    }

    event AddedOrganisation(address indexed sender, uint256 orgCount, string desc);
    event DisableOrganisation(address indexed sender, uint256 orgCount);

    event AddedInfo(address indexed sender, uint256 orgCount, uint256 id);
    event DisableInfo(address indexed sender, uint256 orgCount, uint256 id);

    event AddedAdmin(address indexed sender, uint256 orgCount, address newAddress);
    event RemoveAdmin(address indexed sender, uint256 orgCount, address oldAddress);

    event AddedOperator(address indexed sender, uint256 orgCount, address newAddress);
    event RemoveOperator(address indexed sender, uint256 orgCount, address oldAddress);

    function addOrganisation(string memory desc) external onlyOwner {
        organisationCount++;

        Organisation storage newOrganisation = organisation[organisationCount];
        newOrganisation.active = true;
        newOrganisation.name = desc;

        emit AddedOrganisation(_msgSender(), organisationCount, desc);
    }

    function disableOrganisation(uint256 orgNumber) external onlyOwner {
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        organisation[orgNumber].active = false;
        emit DisableOrganisation(_msgSender(), orgNumber);
    }

    function addAdmin(uint256 orgNumber, address checkAddress) external onlyOwner {
        require(checkAddress != address(0), "TrustedZone: address is zero");
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        require(organisation[orgNumber].admins.add(checkAddress), "TrustedZone: pre-existing data");

        emit AddedAdmin(_msgSender(), orgNumber, checkAddress);
    }

    function removeAdmin(uint256 orgNumber, address checkAddress) external onlyOwner {
        require(checkAddress != address(0), "TrustedZone: address is zero");
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        require(organisation[orgNumber].admins.remove(checkAddress), "TrustedZone: pre-existing data");

        emit RemoveAdmin(_msgSender(), orgNumber, checkAddress);
    }

    function addOperator(uint256 orgNumber, address checkAddress) external onlyAdmin(orgNumber) {
        require(checkAddress != address(0), "TrustedZone: address is zero");
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        require(organisation[orgNumber].operators.add(checkAddress), "TrustedZone: pre-existing data");

        emit AddedOperator(_msgSender(), orgNumber, checkAddress);
    }

    function removeOperator(uint256 orgNumber, address checkAddress) external onlyAdmin(orgNumber) {
        require(checkAddress != address(0), "TrustedZone: address is zero");
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        require(organisation[orgNumber].operators.remove(checkAddress), "TrustedZone: pre-existing data");

        emit RemoveOperator(_msgSender(), orgNumber, checkAddress);
    }

    function isExistAdmin(uint256 orgNumber, address checkAddress) public view returns(bool) {
        require(checkAddress != address(0), "TrustedZone: address is zero");
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        return organisation[orgNumber].admins.contains(checkAddress);
    }

    function isExistOperator(uint256 orgNumber, address checkAddress) public view returns(bool) {
        require(checkAddress != address(0), "TrustedZone: address is zero");
        require(orgNumber <= organisationCount, "TrustedZone: non-existent data");
        return organisation[orgNumber].operators.contains(checkAddress);
    }

    function writeInfo(uint256 orgNumber, uint256 id, string memory newContent) external onlyOperator(orgNumber) {
        Info storage newInfo = info[orgNumber][id];
        require(newInfo.editors.length == 0, "TrustedZone: info is exist");

        newInfo.active = true;
        newInfo.content = newContent;
        newInfo.editors.push(_msgSender());

        emit AddedInfo(_msgSender(), orgNumber, id);
    }

    function disableInfo(uint256 orgNumber, uint256 id) external onlyOperator(orgNumber) {
        Info storage oldInfo = info[orgNumber][id];
        require(oldInfo.active, "TrustedZone: info not active");

        oldInfo.active = false;
        oldInfo.editors.push(_msgSender());

        emit DisableInfo(_msgSender(), orgNumber, id);
    }

    function readInfo(uint256 orgNumber, uint256 id) external view returns(string memory){
        return info[orgNumber][id].content;
    }

    function readAllInfo(uint256 orgNumber, uint256 id) external view returns(Info memory){
        return info[orgNumber][id];
    }

    function viewOrganisation(uint256 orgNumber) external view
    returns(string memory _name, address[] memory _admins, address[] memory _operators, bool _active) {

        Organisation memory org = organisation[orgNumber];
        _name = org.name;
        _admins = org.admins.values();
        _operators = org.operators.values();
        _active = org.active;
    }
}