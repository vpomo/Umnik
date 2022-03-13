var mainChainIdHex = "0x61";
var mainChainIdDec = "97";
var mainRpcUrls = 'https://data-seed-prebsc-2-s2.binance.org:8545/';
var mainBlockExplorerUrls = 'https://testnet.bscscan.com/';
var mainChainName = 'BSC Testnet';

var contractAddress = '0xD41AEb98d12Dc0C80e3BA2d88d54892Da753a4CF';
var abi = '[{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"address","name":"newAddress","type":"address"}],"name":"AddedAdmin","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"}],"name":"AddedInfo","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"address","name":"newAddress","type":"address"}],"name":"AddedOperator","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"string","name":"desc","type":"string"}],"name":"AddedOrganisation","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"}],"name":"DisableInfo","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"}],"name":"DisableOrganisation","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"address","name":"oldAddress","type":"address"}],"name":"RemoveAdmin","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"orgCount","type":"uint256"},{"indexed":false,"internalType":"address","name":"oldAddress","type":"address"}],"name":"RemoveOperator","type":"event"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"address","name":"checkAddress","type":"address"}],"name":"addAdmin","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"address","name":"checkAddress","type":"address"}],"name":"addOperator","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"desc","type":"string"}],"name":"addOrganisation","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"name":"disableInfo","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"}],"name":"disableOrganisation","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"address","name":"checkAddress","type":"address"}],"name":"isExistAdmin","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"address","name":"checkAddress","type":"address"}],"name":"isExistOperator","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"organisationCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"name":"readAllInfo","outputs":[{"components":[{"internalType":"string","name":"content","type":"string"},{"internalType":"address[]","name":"editors","type":"address[]"},{"internalType":"bool","name":"active","type":"bool"}],"internalType":"struct TrustedZone.Info","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"name":"readInfo","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"address","name":"checkAddress","type":"address"}],"name":"removeAdmin","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"address","name":"checkAddress","type":"address"}],"name":"removeOperator","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"}],"name":"viewOrganisation","outputs":[{"internalType":"string","name":"_name","type":"string"},{"internalType":"address[]","name":"_admins","type":"address[]"},{"internalType":"address[]","name":"_operators","type":"address[]"},{"internalType":"bool","name":"_active","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"orgNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"string","name":"newContent","type":"string"}],"name":"writeInfo","outputs":[],"stateMutability":"nonpayable","type":"function"}]';
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        4
var wallet;
var contractController;
var isConnect = false;
var signer;
var provider;
var current_network = undefined;
var decimal = 1e18;
var orgNumber = 0;

window.addEventListener('load', function () {
    connect();
})

function connect() {
    if (isConnect === false) {
        doConnect();
        isConnect = true;
    }
    if(mainChainIdDec === current_network) {
        initControllers();
    }
}

async function addOrganisation() {
    if (provider != undefined) {
        var orgName = $('#addOrgName').val();
        signer = provider.getSigner();
        var writeController = contractController.connect(signer);
        var tx = await writeController.addOrganisation(orgName);
    } else {
        alert('Not connected');
    }
}

async function addAdminOrganisation() {
    if (provider != undefined) {
        signer = provider.getSigner();
        var writeController = contractController.connect(signer);
        var wallet =  $('#addOrgAdmin').val();
        try {
            await writeController.addAdmin(orgNumber, wallet);
        } catch (addError) {
            alert(addError.data.message);
        }
    } else {
        alert('Not connected');
    }
}

async function delAdminOrganisation() {
    if (provider != undefined) {
        signer = provider.getSigner();
        var writeController = contractController.connect(signer);
        var wallet =  $('#delOrgAdmin').val();
        try {
            await writeController.removeAdmin(orgNumber, wallet);
        } catch (addError) {
            alert(addError.data.message);
        }
    } else {
        alert('Not connected');
    }
}

async function addOperatorOrganisation() {
    if (provider != undefined) {
        signer = provider.getSigner();
        var writeController = contractController.connect(signer);
        var wallet =  $('#addOrgOperator').val();
        try {
            await writeController.addOperator(orgNumber, wallet);
        } catch (addError) {
            alert(addError.data.message);
        }
    } else {
        alert('Not connected');
    }
}

async function delOperatorOrganisation() {
    if (provider != undefined) {
        signer = provider.getSigner();
        var writeController = contractController.connect(signer);
        var wallet =  $('#delOrgOperator').val();
        try {
            await writeController.removeOperator(orgNumber, wallet);
        } catch (addError) {
            alert(addError.data.message);
        }
    } else {
        alert('Not connected');
    }
}

async function addUserInfo() {
    if (provider != undefined) {
        signer = provider.getSigner();
        var writeController = contractController.connect(signer);
        var id =  $('#addUserId').val();
        var content =  $('#addUserInfo').val();
        try {
            await writeController.writeInfo(orgNumber, id, content);
        } catch (addError) {
            alert(addError.data.message);
        }
    } else {
        alert('Not connected');
    }
}

async function readUserInfo() {
    var id =  $('#readUserId').val();
    var info = await contractController.readInfo(orgNumber, id);
    console.log("readUserInfo", info);
    $('#readUserInfo').html(info);
}

async function fillTotalVariable() {
    const accounts = await ethereum.request({ method: 'eth_accounts' }).catch(checkErrEthAccounts());

    var htmlValue = '<a href="https://testnet.bscscan.com/address/' + contractAddress + '/code"' + '>' + contractAddress + ' </a>';
    $('#contractAddressLink').html(htmlValue);

    var myAddress = accounts[0];
    console.log("myAddress", myAddress);
    $('#myAddress').html(myAddress);

    var myBalance = await provider.getBalance(accounts[0]);
    myBalance = Number(myBalance)/decimal;
    console.log("myBalance", myBalance);
    $('#myBalance').html(myBalance.toFixed(3));

    var contractBalance = Number(await provider.getBalance(contractAddress))/decimal;
    console.log("contractBalance", contractBalance);
    $('#contractBalance').html(contractBalance.toFixed(3));
}

async function readOrganisations() {
    var organisationCount = Number(await contractController.organisationCount());
    console.log("organisationCount", organisationCount);
    await loadOrganisations(organisationCount);
}

async function doConnect() {
    let ethereum = window.ethereum;
    ethereum
        .request({ method: 'eth_requestAccounts' })
        .then((handleAccountsChanged) =>
        {
            provider = new ethers.providers.Web3Provider(ethereum);
            signer = provider.getSigner();
            if (current_network === mainChainIdDec) {
                connect();
            }
        }
        )
        .catch((error) => {
            if (error.code === 4001) {
                // EIP-1193 userRejectedRequest error
                console.log('Please connect to MetaMask.');
            } else {
                console.error(error);
                alert("Please refresh the page");
            }
        });
    await switchEthereumChain();
    current_network = ethereum.networkVersion;
    if (current_network === mainChainIdDec) {
        initControllers();
    } else if (isConnect) {
        isConnect = false;
        //location.reload();
    }
    console.log("doConnect() current_network", current_network);
    if (current_network != mainChainIdDec) {
         await switchEthereumChain();
    }

    const accounts = await ethereum.request({ method: 'eth_accounts' }).catch(checkErrEthAccounts());
    wallet = accounts[0];
}

async function checkErrEthAccounts(error) {
    if (isConnect && current_network != mainChainIdDec) {
    }
}

async function switchEthereumChain() {
    if(current_network === null || current_network != mainChainIdDec) {
        console.log('switchEthereumChain');
        let ethereum = window.ethereum;
        try {
            await ethereum.request({
                method: 'wallet_switchEthereumChain',
                params: [{ chainId: '0x61' }],
            }).then((handleswitchEthereumChain) =>
            {
            })
                .catch();
        } catch (switchError) {
            signer = undefined;
            // This error code indicates that the chain has not been added to MetaMask.
            isConnect = false;
            if (switchError.code === 4902) {
                try {
                    await switchToMain();
                } catch (addError) {
                    // handle "add" error
                }
            }
            // handle other "switch" errors
        }
    }
}

async function switchToMain() {
    console.log('switchToMain()');
    if(current_network === null) {
        let ethereum = window.ethereum;
        const data = [{
            chainId: '0x61',
            chainName: mainChainName,
            nativeCurrency: {
                name: 'BNB',
                symbol: 'BNB',
                decimals: 18,
            },
            rpcUrls: [mainRpcUrls],
            blockExplorerUrls: [mainBlockExplorerUrls],
        }]
        const tx = await ethereum.request({method: 'wallet_addEthereumChain', params:data}).catch()
        current_network = ethereum.networkVersion;
        if (tx) {
            console.log('tx = ',tx);
        }
    }
}

function initContracts() {
    if (signer === undefined) {
        isConnect = false;
        return ;
    }
}

function initControllers() {
    contractController = new ethers.Contract(contractAddress, abi, provider);
    console.log('initControllers ...', contractController);
    isConnect = true;
    checkShowConnect();
}

function startApp() {
    fillTotalVariable();
    readOrganisations();
}

function checkShowConnect() {
    console.log('checkShowConnect() isConnect = ', isConnect);
     if (isConnect && current_network === mainChainIdDec) {
         $('#connectButton').hide();
         $('#orgData').hide();
         $('#writeDoc').hide();
         $('#readDoc').hide();

         startApp();
     } else {
         $('#connectButton').show();
         alert('Please, change network');
    }
}

function timer(newDate) {
    $('#countdown').timeTo({
        timeTo: new Date(newDate),
        displayDays: 0,
    });

    $('.timeTo div:eq(1)').after('<span>:</span>');
}

function timeConverter(UNIX_timestamp){
    var a = new Date(UNIX_timestamp * 1000);
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    var year = a.getFullYear();
    var month = months[a.getMonth()];
    var date = a.getDate();
    var hour = a.getHours();
    var min = a.getMinutes();
    var sec = a.getSeconds();
    var time = month + ' ' + date + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
    return time;
}

async function loadOrganisations(count) {
    //$('#currentOrg').hide();
    $('#orgData').hide();
    $('#writeDoc').hide();
    $('#readDoc').hide();

    for(var i=1; i<count+1; i++) {
        var viewOrganisation = await contractController.viewOrganisation(i);
        console.log("viewOrganisation", viewOrganisation);

        var buttonSelect = '<button class="btn btn-outline-primary btn-sm" onclick="selectOrg(' + i +');">выбрать</button>';
        var buttonDelete = '<button class="btn btn-outline-danger btn-sm" onclick="delOrg(' + i +');">удалить</button>';
        var markup = "<tr><td>" + i
            + "</td><td>" + viewOrganisation._name
            + "</td><td>" + buttonSelect
            + "</td><td>" + buttonDelete
            + "</td></tr>";
        $("table tbody").append(markup);
    }
    initTableManager();
}

function initTableManager() {
    $('.tablemanager').tablemanager({
        firstSort: [[0,'asc'],[1,0]],
        disable: [3,"last"],
        appendFilterby: true,
        dateFormat: [[4,"mm-dd-yyyy"]],
        debug: true,
        vocabulary: {
            voc_filter_by: 'Фильтр по',
            voc_type_here_filter: 'Фильтровать...',
            voc_show_rows: 'Строк на страницу'
        },
        pagination: true,
        showrows: [6,10,20,50,100],
        disableFilterBy: [3,4]
    });
}

async function selectOrg(number) {
    $('#orgData').show();
    $('#writeDoc').show();
    $('#readDoc').show();

    orgNumber = number;
    var viewOrganisation = await contractController.viewOrganisation(number);
    $('#orgName').html(viewOrganisation._name);

    var admins = viewOrganisation._admins;
    var viewAdmins = "";
    for(var i=0; i<admins.length; i++){
        viewAdmins = viewAdmins + '"' + admins[i] + '"' + '\n'
    }
    $('#listOrgAdmin').val(viewAdmins);

    var opers = viewOrganisation._operators;
    var viewOpers = "";
    for(var i=0; i<opers.length; i++){
        viewOpers = viewOpers + '"' + opers[i] + '"' + '\n'
    }
    $('#listOrgOperators').val(viewOpers);
}