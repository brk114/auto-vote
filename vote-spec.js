describe("Vote for every half an hour", function () {
  it("should cast a vote", function () {
    browser.ignoreSynchronization = true;
    if (configVariables.doFbLogin) {
      browser.get(configVariables.fbLoginUrl);
      browser.sleep(3500);
      element(by.id("email")).sendKeys(configVariables.fbUserName);
      element(by.id("pass")).sendKeys(configVariables.fbPwd);
      element(by.css('[name="login"]')).click();
      browser.sleep(6000);
    }

    browser.get(configVariables.voteUrl);

    browser.sleep(6000);

    var verificationBtn = element(by.css("#verification_vote_btn"));
    // printing current votes count
    var votesCount = element(by.css("#vote_count_t"));
    votesCount.getText().then((text) => {
      console.log("Count of votes: " + text.replace(/\n/g, " "));
    });

    console.log("");

    verificationBtn.isPresent().then((isPresent) => {
      if (isPresent) {
        console.log("Found Refresh token button, Clicking FB token refresh");
        verificationBtn.click();
        browser.sleep(3000);
        // waiting for reload
      } else console.log("Refresh token button not found");

      var voteBtn = element(by.css("#vote_btn"));
      voteBtn.isPresent().then((isVotingAllowed) => {
        if (isVotingAllowed) {
          console.log("Found vote button, Clicking actual voting");
          voteBtn.click();
          // printing current votes count
          console.log("Voted successfully " + new Date().toLocaleString());
          browser.sleep(3000);
          // waiting for close
        } else console.log("vote button not found, counter is still going");
      });
    });

    // You wrote your first test, cross it off the list
    // todoList.get(2).element(by.css("input")).click();
    // var completedAmount = element.all(by.css(".done-true"));
    // expect(completedAmount.count()).toEqual(2);
  });
});
