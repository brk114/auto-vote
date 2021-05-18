exports.config = {
  directConnect: true,
  seleniumAddress: "http://localhost:4444/wd/hub",
  specs: ["vote-spec.js"],
  onPrepare: async () => {
    global.configVariables = require("./global-config");
  },
  capabilities: {
    browserName: "chrome",
    chromeOptions: {
      args: [
        "--user-data-dir=C:\\Users\\ravib\\AppData\\Local\\BraveSoftware\\Brave-Browser\\Protractor",
      ],
    },
  },
};
