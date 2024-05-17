const CourseRegistration = artifacts.require("CourseRegistration");

module.exports = function (deployer) {
  deployer.deploy(CourseRegistration);
};
