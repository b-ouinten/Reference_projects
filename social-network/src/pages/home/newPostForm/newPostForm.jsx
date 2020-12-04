import './newPostForm.scss';
import React, { useState } from 'react';

const NewPostForm = () => {
  // eslint-disable-next-line no-unused-vars
  const [input, setInput] = useState('');

  return (
    <div className="newPost">
      <form>
        <textarea name="post" placeholder="Write post..." />
        <div className="submit">
          <input type="submit" value="Wazoet" />
        </div>
      </form>
    </div>
  );
};

export default NewPostForm;
