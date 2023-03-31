function slider() {
    const togglePublic = document.getElementById('public_toggle');
    const csrfToken = document.getElementById('csrf-token').value;
    const isPublic = togglePublic.textContent === 'true';
    togglePublic.textContent = isPublic ? 'false' : 'true';
  
    const formData = new FormData();
    formData.append('public_toggle', togglePublic.textContent);
    formData.append('authenticity_token', csrfToken);
  
    fetch(`${window.location.href}/toggle_public`, {
      method: 'POST',
      body: formData
    });
  }
  