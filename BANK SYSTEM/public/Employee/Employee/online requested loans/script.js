// bytewebster.com
// bytewebster.com
// bytewebster.com
function showSweetAlert() {
  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Confirm it!'
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire(
        'confirmed!',
        'Request Accepted.',
        'success'
      )
    }
  })
}

// JavaScript function to update the profile picture
function updateProfilePic(input) {
  const profilePic = document.getElementById('profilePic');

  if (input.files && input.files[0]) {
      const reader = new FileReader();

      reader.onload = function (e) {
          profilePic.src = e.target.result;
      };

      reader.readAsDataURL(input.files[0]);
  }
}

// JavaScript to trigger the file input when the profile picture is clicked
const profilePicContainer = document.getElementById('profilePicContainer');
const profilePicInput = document.getElementById('profilePicInput');

profilePicContainer.addEventListener('click', function () {
  profilePicInput.click();
});
